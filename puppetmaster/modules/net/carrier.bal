// Filename: puppetmaster/modules/net/carrier.bal
// Author: Nathanne Isip
// License: Mozilla Public License 2.0 (MPL-2.0)

import ballerina/http;
import ballerina/io;
import rheolaeth.crypt;

type PuppetResponse readonly & record {
    string status;
    string content;
};

public function sendPayload(
    string ipAddress,
    int port,
    string key,
    string script
) {
    http:Client|error conn = new (ipAddress + ":" + port.toString());
    if conn is error {
        io:println("\u{001b}[31mNetwork Error\u{001b}[0m: " + conn.message());
        return;
    }

    PuppetResponse|error resp = conn->get("/payload?script=" + script);
    if resp is error {
        io:println("\u{001b}[31mRequest Error\u{001b}[0m: " + resp.message());
        return;
    }

    if resp.status == "1" {
        var decrypted = crypt:aesEcbDecrypt(key, resp.content);
        if decrypted is error {
            io:println("\u{001b}[31mDecryption Error\u{001b}[0m: " + decrypted.message());
            return;
        }

        io:print(decrypted);
        if !decrypted.endsWith("\n") {
            io:println();
        }
    }
    else {
        io:println("\u{001b}[31mPayload Error\u{001b}[0m: " + resp.content);
    }
}