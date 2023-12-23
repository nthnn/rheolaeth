import ballerina/crypto;

public isolated function aesEcbEncrypt(string key, string message) returns string | error {
    byte[] encryptedBytes = check crypto:encryptAesEcb(message.toBytes(), key.toBytes());
    return encryptedBytes.toBase64();
}
