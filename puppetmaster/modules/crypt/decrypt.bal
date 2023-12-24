import ballerina/crypto;
import ballerina/mime;

public function aesEcbDecrypt(string key, string encodedMessage) returns string | error {
    byte[] fromEncrypted = [];
    var result = mime:base64Decode(encodedMessage.toBytes());
    if result is byte[] {
        fromEncrypted = result;
    }
    else {
        return error("Cannot decode base64.");
    }

    byte[] decryptedBytes = check crypto:decryptAesEcb(fromEncrypted, key.toBytes());
    return string:fromBytes(decryptedBytes);
}