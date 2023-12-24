import ballerina/io;
import rheolaeth.net;
import rheolaeth.util;

public function repl(int port, string key) returns error? {
    string ipAddress = util:getCleanIpAddress();
    io:println();

    puppetMasterShell(
        "\u{001b}[36m[\u{001b}[0m\u{001b}[1m" + ipAddress +
            "\u{001b}[0m\u{001b}[36m@\u{001b}[0m" + port.toString() +
            "\u{001b}[36m]\u{001b}[0m #~ ",
        ipAddress, key,
        function (string address, string payload, string password) {
            net:sendPayload(ipAddress, port, key, payload);
        }
    );
}

public function puppetMasterShell(
    string shellStr, string recipient, string key,
    function (string ipAddress, string payload, string password) callback
) {
    while true {
        string input = io:readln(shellStr);

        callback(
            ipAddress = recipient,
            payload = input,
            password = key
        );
    }
}