// Filename: puppet/modules/response/response.bal
// Author: Nathanne Isip
// License: Mozilla Public License 2.0 (MPL-2.0)

import ballerina/lang.regexp;

public isolated function errorResponse(string message) returns json {
    return {
        "status": "0",
        "content": regexp:replaceAll(re `[\\"]`, message, "\\\"", 0)
    };
}

public isolated function successResponse(string content) returns json {
    return {
        "status": "1",
        "content": content
    };
}