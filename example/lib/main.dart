import 'package:flutter/material.dart';
import 'dart:async';
import 'package:simple_rsa2/simple_rsa2.dart';

import 'package:flutter/services.dart';
import 'package:mz_rsa_plugin/mz_rsa_plugin.dart';

const String PUBLICK_KEY = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEArdklK4kIsOMuxTZ8jG1PRPfXqSDmaCIQ+xEpIRSssQ6jiuvhYZTMUbV22osgtivuyKdnHm+cvzGuZCSB8QFyCcM7l09HZVs0blLkrBAU5CVSv+6BzPQTVJytoi/VO4mlf6me1Y9bXWrrPw1YtC1mnB2Ix9cuaxOLpucglfGbUaGEigsUZMTD2vuEODN5cJi39ap+G9ILitbrnt+zsW9354pokVnHw4Oq837Fd7ZtP0nAA5F6nE3FNDGQqLy2WYRoKC9clDecD8T933azUD98b5FSUGzIhwiuqHHeylfVbevbBW91Tvg9s7vUMr0Y2YDpEmPAf0q4PlDt8QsjctT9kQIDAQAB";
const String PRIVART_KEY = "MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCt2SUriQiw4y7FNnyMbU9E99epIOZoIhD7ESkhFKyxDqOK6+FhlMxRtXbaiyC2K+7Ip2ceb5y/Ma5kJIHxAXIJwzuXT0dlWzRuUuSsEBTkJVK/7oHM9BNUnK2iL9U7iaV/qZ7Vj1tdaus/DVi0LWacHYjH1y5rE4um5yCV8ZtRoYSKCxRkxMPa+4Q4M3lwmLf1qn4b0guK1uue37Oxb3fnimiRWcfDg6rzfsV3tm0/ScADkXqcTcU0MZCovLZZhGgoL1yUN5wPxP3fdrNQP3xvkVJQbMiHCK6ocd7KV9Vt69sFb3VO+D2zu9QyvRjZgOkSY8B/Srg+UO3xCyNy1P2RAgMBAAECggEAInVN9skcneMJ3DEmkrb/5U2yw2UwBifqcbk/C72LVTTvmZOTgsH5laCARGUbQMCIfeEggVniGcuBI3xQ/TIqJmE6KI2gOyjOxadMiAZP/cCgHEbsF3Gxey3rBKCyhTCNSzaVswLNO0D8C+1bTatKEVuRRvsRykt/fL+HJ/FRteYYO9LuLv2WESJGE6zsi03P6snNiRracvYqz+Rnrvf1Xuyf58wC1C6JSjZ9D6tootPDBTEYaIIbpEnV+qP/3k5OFmA9k4WbkZI6qYzqSK10bTQbjMySbatovnCD/oqIUOHLwZpL051E9lz1ZUnDbrxKwT0BIU7y4DYaHSzrKqRsIQKBgQDTQ9DpiuI+vEj0etgyJgPBtMa7ClTY+iSd0ccgSE9623hi1CHtgWaYp9C4Su1GBRSF0xlQoVTuuKsVhI89far2Z0hR9ULr1J1zugMcNESaBBC17rPoRvXPJT16U920Ntwr00LviZ/DEyvmpVDagYy+mSK0Wq+kH7p5aR5zAHXWrQKBgQDSqQ6TBr5bDMvhpRi94unghiWyYL6srSRV9XjqDpiNU+yFwCLzSG610DyXFa3pV138P+ryunqg1LtKsOOtZJONzbS1paINnwkvfwzMpI7TjCq1+8rxeEhZ3AVmumDtPQK+YfGbxCQ+LAOJZOu8lGv1O7tsbXFp0vh5RmWHWHvy9QKBgCMGPi9JsCJ4cpvdddQyizLk9oFxwAlMxx9G9P08H7kdg4LW6l0Gs+yg/bBf86BFHVbmXW8JoBwHj418sYafO+Wnz8yOna6dTBEwiG13mNvzypVu4nKiuQPDh8Ks/rdu1OeLGbC+nzbnCcMuKw5epee/WYqO8kmCXRbdv4ePTvntAoGBAJYQ9F7saOI3pW2izJNIeE8HgQcnP+2GkeHiMjaaGzZiWJWXH86rBKLkKqV+PhuBr2QorFgpW34CzUER7b7xbOORbHASA/UsG8EIArgtacltimeFbTbC9td8kyRxFOcrlS7GWvUZrq/TbtmLWRtHp/hUitlcxXQbZAIQkfbuo62ZAoGBAKBURvLGM0ethkvUHFyGae2YGG/s+u+EYd2zNba7A6qnfzrlMHVPiPO6lx31+HwhuJ0tBZWMJKhEZ5PWByZzreVKVH5fE5LoQLo+B3VCTyTc1fJ9RKLAPrPqHuvzPHHP/n84XHGeit3e4ytd3Mm/6CNbrg7xux2M4RDQmN//1UOY";

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var originText = "hello hello hello hello hello";
  var publicKeyEncryptText = "";
  var privateKeyDecryptText = "";
  var privateKeyEncryptText = "";
  var publicKeyDecryptText = "";

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {

    var str1 = await MzRsaPlugin.encryptStringByPublicKey(originText, PUBLICK_KEY);
    var str2 = await MzRsaPlugin.decryptStringByPrivateKey(str1, PRIVART_KEY);

    var str3 = await MzRsaPlugin.encryptStringByPrivateKey(originText, PRIVART_KEY);
    var str4 = await MzRsaPlugin.decryptStringByPublicKey(str3, PUBLICK_KEY);

    print(str1);
    print(str2);
    print(str3);
    print(str4);

    setState(() {
      this.publicKeyEncryptText = str1;
      this.privateKeyDecryptText = str2;
      this.privateKeyEncryptText = str3;
      this.publicKeyDecryptText = str4;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: ListView(
          children: [
            Text("加密前数据:$originText", style: TextStyle(fontSize: 16),),
            SizedBox(height: 20,),
            Text("公钥加密原数据后:$publicKeyEncryptText", style: TextStyle(fontSize: 16),),
            SizedBox(height: 20,),
            Text("私钥解密公钥加密后的数据:$privateKeyDecryptText", style: TextStyle(fontSize: 16),),
            SizedBox(height: 20,),
            Text("私钥加密原数据后:$privateKeyEncryptText", style: TextStyle(fontSize: 16),),
            SizedBox(height: 20,),
            Text("公钥解密私钥加密后的数据:$publicKeyDecryptText", style: TextStyle(fontSize: 16),),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
