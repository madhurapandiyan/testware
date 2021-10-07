import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:laravel/controller/exception/exception.dart';

class Dataprovider with ChangeNotifier {
  var token =
      "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiNmZkZDhiYTNmZjY5ZWEzNGFhMjY4NjZkMDk1NGU5ZDVmMGMzYmE0OWUzYWVkYzVkYmQxODc2ZDM5Y2EwODlhZWQ1MmE1OThlNjllMzY4MDMiLCJpYXQiOjE2MzE4NjAzMTUsIm5iZiI6MTYzMTg2MDMxNSwiZXhwIjoxNjYzMzk2MzE1LCJzdWIiOiIxODgiLCJzY29wZXMiOltdfQ.mK8NMG8A0thg5KuY7LwMn3qITxdciDZUxJ21EQO9wnfhWkQB9LizkS40lvkEg4KfEspUKpO2uuEUKQvGU3BcSdMWd38z2grEPHwdIjauYGxFB6Ya5CplDTT3RqTgPOjjN9I4oYahdB0zY8NqG4YRcbhkVnGs6CjkrolZLZ4_T4nt8nMJKjE3ao1J4EPjGqBEySknjIsGzL2mBIt3rIMreEz0UWN3cm8y_UxueUbPcFQAIJVoxJN7SDmLOaGs5cSOpQGvgm_4zM35KcJvSAKO4_ZbEwpncQve-KJ0YDfCwE-th4Gx6_TNw4puzc1g7jsjbbktg-oYVZl6zY3qr_1s_zgek46d5OkW4L2YqLZrxAdw-lEjM-bDcxV_CDtLqDOwB1e5dN_BQmJd2FdOOwsqxGpo7qExy7HiutbEVffYyTCH_8oGNgqY8B2ozzYTv85LyT7B7ZVU85KDi23E3lxXn45QHnKqGrCInSBqXN1o36YaXZUWcjxr-qXR1ploSxMN1i7n4hzpsd7CPgpqd4PbAnPO48s_HwzfLmKgBXrZdPob5NrDkE2_lY3pNCO2WCyvN6mvKMvfLR97_JmzvmFWjrNTDEejIA53wsmWirkzY81j2LMiD60cUL8_nZKLthahOM38Vk8SA5s3oWh85IdynA-Z6uoG4WY5Hgj6_QjSu80";
  List _carousal = [];

  List get carousal {
    return [..._carousal];
  }

  Future<void> gettingdata() async {
    try {
     
      List dummy = [];
      final url = "https://admin.blissme.hk/public/api/services";
      final dio = Dio();
      final responce = await dio.get(url,
          options: Options(headers: {"Authorization": token}));
      final getdata = responce.data as Map<String, dynamic>;
      

      getdata["carousel"].map((e) {
        var values = e["image"];
        dummy.add(values);
      }).toList();

      _carousal = dummy;
    } catch (e) {
      
    }

    notifyListeners();
  }
}
