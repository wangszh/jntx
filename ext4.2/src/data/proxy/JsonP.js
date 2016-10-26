/*
This file is part of Ext JS 4.2

Copyright (c) 2011-2013 Sencha Inc

Contact:  http://www.sencha.com/contact

GNU General Public License Usage
This file may be used under the terms of the GNU General Public License version 3.0 as
published by the Free Software Foundation and appearing in the file LICENSE included in the
packaging of this file.

Please review the following information to ensure the GNU General Public License version 3.0
requirements will be met: http://www.gnu.org/copyleft/gpl.html.

If you are unsure which license is appropriate for your use, please contact the sales department
at http://www.sencha.com/contact.

Build date: 2013-05-16 14:36:50 (f9be68accb407158ba2b1be2c226a6ce1f649314)
*/
Ext.define('Ext.data.proxy.JsonP', {
    extend: 'Ext.data.proxy.Server',
    alternateClassName: 'Ext.data.ScriptTagProxy',
    alias: ['proxy.jsonp', 'proxy.scripttag'],
    requires: ['Ext.data.JsonP'],

    defaultWriterType: 'base',

    /**
     * @cfg {String} callbackKey
     * See {@link Ext.data.JsonP#callbackKey}.
     */
    callbackKey : 'callback',

    /**
     * @cfg {String} [recordParam=records]
     * The HTTP parameter name to use when passing records to the server and the {@link #writer Json writer} is not configured
     * to {@link Ext.data.writer.Json#encode encode} records into a parameter.
     * 
     * The {@link #encodeRecords} method is used to encode the records to create this parameter's value.
     */
    recordParam: 'records',

    /**
     * @cfg {Boolean} autoAppendParams
     * True to automatically append the request's params to the generated url. Defaults to true
     */
    autoAppendParams: true,

    constructor: function() {
        this.addEvents(
            /**
             * @event
             * Fires when the server returns an exception. This event may also be listened
             * to in the event that a request has timed out or has been aborted.
             * @param {Ext.data.proxy.Proxy} this
             * @param {Ext.data.Request} request The request that was sent
             * @param {Ext.data.Operation} operation The operation that triggered the request
             */
            'exception'
        );
        this.callParent(arguments);
    },

    /**
     * @private
     * Performs the read request to the remote domain. JsonP proxy does not actually create an Ajax request,
     * instead we write out a `<script>` tag based on the configuration of the internal Ext.data.Request object
     * @param {Ext.data.Operation} operation The {@link Ext.data.Operation Operation} object to execute
     * @param {Function} callback A callback function to execute when the Operation has been completed
     * @param {Object} scope The scope to execute the callback in
     */
    doRequest: function(operation, callback, scope) {
        //generate the unique IDs for this request
        var me      = this,
            request = me.buildRequest(operation),
            params  = request.params;

        // apply JsonP proxy-specific attributes to the Request
        Ext.apply(request, {
            callbackKey: me.callbackKey,
            timeout: me.timeout,
            scope: me,
            disableCaching: false, // handled by the proxy
            callback: me.createRequestCallback(request, operation, callback, scope)
        });

        // If we are responsible for appending the params to the URL, clear them now so that
        // The Ext.data.JsonP singleton does not append them.
        if (me.autoAppendParams) {
            request.params = {};
        }

        request.jsonp = Ext.data.JsonP.request(request);
        // restore on the request
        request.params = params;
        operation.setStarted();
        me.lastRequest = request;

        return request;
    },

    /**
     * @private
     * Creates and returns the function that is called when the request has completed. The returned function
     * should accept a Response object, which contains the response to be read by the configured Reader.
     * The third argument is the callback that should be called after the request has been completed and the Reader has decoded
     * the response. This callback will typically be the callback passed by a store, e.g. in proxy.read(operation, theCallback, scope)
     * theCallback refers to the callback argument received by this function.
     * See {@link #doRequest} for details.
     * @param {Ext.data.Request} request The Request object
     * @param {Ext.data.Operation} operation The Operation being executed
     * @param {Function} callback The callback function to be called when the request completes. This is usually the callback
     * passed to doRequest
     * @param {Object} scope The scope in which to execute the callback function
     * @return {Function} The callback function
     */
    createRequestCallback: function(request, operation, callback, scope) {
        var me = this;

        return function(success, response, errorType) {
            delete me.lastRequest;
            me.processResponse(success, operation, request, response, callback, scope);
        };
    },

    // inherit docs
    setException: function(operation, response) {
        operation.setException(operation.request.jsonp.errorType);
    },


    /**
     * Generates a url based on a given Ext.data.Request object. Adds the params and callback function name to the url
     * @param {Ext.data.Request} request The request object
     * @return {String} The url
     */
    buildUrl: function(request) {
        var me      = this,
            url     = me.callParent(arguments),
            records = request.records,
            writer  = me.getWriter(),
            params,
            filters,
            filter, i;

        // In the JsonP proxy, params may only go into the URL.
        // So params created by the Writer get applied to the request's params here
        if (writer && request.operation.allowWrite()) {
            request = writer.write(request);
        }

        // Encode filters into the URL via params
        params  = request.params;
        filters = params.filters,
        delete params.filters;
        if (filters && filters.length) {
            for (i = 0; i < filters.length; i++) {
                filter = filters[i];

                if (filter.value) {
                    params[filter.property] = filter.value;
                }
            }
        }

        // If there's no writer, or the writer is not configured to encode the records into a parameter, then we have to do it here.
        if ((!writer || !writer.encode) && Ext.isArray(records) && records.length > 0) {
            params[me.recordParam] = me.encodeRecords(records);
        }

        // If we are responsible for appending the params to the URL, do it now.
        // The params are cleared in doRequest so that the Ext.data.JsonP singleton does not add them.
        if (me.autoAppendParams) {
            url = Ext.urlAppend(url, Ext.Object.toQueryString(params));
        }

        return url;
    },

    /**
     * Aborts the current server request if one is currently running
     */
    abort: function() {
        var lastRequest = this.lastRequest;
        if (lastRequest) {
            Ext.data.JsonP.abort(lastRequest.jsonp);
        }
    },

    /**
     * Encodes an array of records into a value suitable to be added to the request `params` as the {@link #recordParam} parameter.
     * This is broken out into its own function so that it can be easily overridden.
     * 
     * The default implementation 
     * @param {Ext.data.Model[]} records The records array
     * @return {Array} An array of record data objects
     */
    encodeRecords: function(records) {
        var encoded = [],
            i = 0,
            len = records.length;

        for (; i < len; i++) {
            encoded.push(Ext.encode(records[i].getData()));
        }

        return encoded;
    }
});
