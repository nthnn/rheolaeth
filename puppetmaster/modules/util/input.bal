// Filename: puppetmaster/modules/util/input.bal
// Author: Nathanne Isip
// License: Mozilla Public License 2.0 (MPL-2.0)

import ballerina/io;
import ballerina/lang.regexp;

public function getCleanIpAddress() returns string {
    var ipAddress = getIpAddress();
    while ipAddress is error {
        io:println("\u{001b}[31mError\u{001b}[0m: " + ipAddress.message());
        ipAddress = getIpAddress();
    }

    if ipAddress is error {
        // Unreachable
        return "";
    }

    return ipAddress;
}

function getIpAddress() returns string | error {
    string input = io:readln("\u{001b}[36mRecipient IP\u{001b}[0m: ");

    if !regexp:isFullMatch(re `^((25[0-5]|(2[0-4]|1\d|[1-9]|)\d)\.){3}(25[0-5]|(2[0-4]|1\d|[1-9]|)\d)$`, input) {
        return error("Invalid IP address \"" + input + "\"");
    }
    return input;
}