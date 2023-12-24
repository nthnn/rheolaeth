import ballerina/io;
import ballerina/lang.regexp;
import rheolaeth.util;

public function repl(string shell, int port) returns error? {
    string ipAddress = util:getCleanIpAddress();
    io:println();

    puppetMasterShell(
        regexp:replace(re `\$addr`, shell, ipAddress),
        ipAddress,
        function (string address, string payload) {
        }
    );
}

public function puppetMasterShell(
    string shellStr, string recipient,
    function (string ipAddress, string payload) callback
) {
    while true {
        string input = io:readln(shellStr);

        callback(
            ipAddress = recipient,
            payload = input
        );
    }
}