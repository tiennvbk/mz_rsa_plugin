# mz_rsa_plugin

Flutter RSA Encryption & Decryption（Flutter RSA 加密和解密）

## Usage

To use the plugin ,add `mz_rsa_plugin` as a dependency in your pubspec.yaml

### Example

``` dart
    //Encrypt string by public key,the public key is String (使用公钥加密字符串，公钥是字符串)
    var str1 = await MzRsaPlugin.encryptStringByPublicKey(originText, PUBLICK_KEY);
    // Decrypt the encrypted string by private key, the private key is String（使用私钥解密公钥加密过的字符串，私钥是字符串）
    var str2 = await MzRsaPlugin.decryptStringByPrivateKey(str1, PRIVART_KEY);

     //Encrypt string by private key,the private key is String (使用私钥加密字符串，私钥是字符串)
    var str3 = await MzRsaPlugin.encryptStringByPrivateKey(originText, PRIVART_KEY);
    // Decrypt the encrypted string by public key, the public key is String（使用公钥解密私钥加密过的字符串，公钥是字符串）
    var str4 = await MzRsaPlugin.decryptStringByPublicKey(str3, PUBLICK_KEY);
```

Please see the example of this plugin for a full example

[See the plugin in github](https://github.com/1691665955/mz_rsa_plugin)



