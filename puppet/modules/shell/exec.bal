import ballerina/io;
import ballerina/os;

public isolated function shellExecute(string command, string[]? arguments) returns string | error {
    os:Process proc = check os:exec({
        value: command,
        arguments: arguments ?: []
    }, BAL_CONFIG_FILE = "Config.toml");

    return string:fromBytes(check proc.output(io:stdout));
}