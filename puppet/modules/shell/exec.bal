import ballerina/os;

public isolated function shellExecute(string script) returns string | error {
    os:Process proc = check os:exec({
        value: "bash",
        arguments: ["-c", script]
    });

    _ = check proc.waitForExit();
    return string:fromBytes(check proc.output());
}