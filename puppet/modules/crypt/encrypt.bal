// Filename: puppet/modules/crypt/encrypt.bal
// Author: Nathanne Isip
// License: Mozilla Public License 2.0 (MPL-2.0)

import ballerina/crypto;

public isolated function aesEcbEncrypt(string key, string message) returns string | error {
    byte[] encryptedBytes = check crypto:encryptAesEcb(message.toBytes(), key.toBytes());
    return encryptedBytes.toBase64();
}
