import ballerina/lang.regexp;

public isolated function errorResponse(string message) returns string {
    return "{\"status\": \"0\", \"message\": \"" + regexp:replaceAll(re `[\\"]`, message, "\\\"", 0) + "\"}";
}

public isolated function successResponse(string content) returns string {
    return "{\"status\": \"1\", \"content\": \"" + content + "\"}";
}