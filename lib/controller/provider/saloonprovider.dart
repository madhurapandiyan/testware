import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:laravel/controller/provider/serviceprovider.dart';
import 'package:laravel/model/saloon.dart';
import 'package:laravel/model/services.dart';

class Saloonprovider with ChangeNotifier {
  List<Saloon> _items = [];
  List<Saloon> get items {
    return [..._items];
  }

  List serviceid = [];

  var notfound =
      "https://cdn.dribbble.com/users/1281958/screenshots/4896646/media/55256acfd3d158e6be043910f87c646a.gif";

  var token =
      "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiNmZkZDhiYTNmZjY5ZWEzNGFhMjY4NjZkMDk1NGU5ZDVmMGMzYmE0OWUzYWVkYzVkYmQxODc2ZDM5Y2EwODlhZWQ1MmE1OThlNjllMzY4MDMiLCJpYXQiOjE2MzE4NjAzMTUsIm5iZiI6MTYzMTg2MDMxNSwiZXhwIjoxNjYzMzk2MzE1LCJzdWIiOiIxODgiLCJzY29wZXMiOltdfQ.mK8NMG8A0thg5KuY7LwMn3qITxdciDZUxJ21EQO9wnfhWkQB9LizkS40lvkEg4KfEspUKpO2uuEUKQvGU3BcSdMWd38z2grEPHwdIjauYGxFB6Ya5CplDTT3RqTgPOjjN9I4oYahdB0zY8NqG4YRcbhkVnGs6CjkrolZLZ4_T4nt8nMJKjE3ao1J4EPjGqBEySknjIsGzL2mBIt3rIMreEz0UWN3cm8y_UxueUbPcFQAIJVoxJN7SDmLOaGs5cSOpQGvgm_4zM35KcJvSAKO4_ZbEwpncQve-KJ0YDfCwE-th4Gx6_TNw4puzc1g7jsjbbktg-oYVZl6zY3qr_1s_zgek46d5OkW4L2YqLZrxAdw-lEjM-bDcxV_CDtLqDOwB1e5dN_BQmJd2FdOOwsqxGpo7qExy7HiutbEVffYyTCH_8oGNgqY8B2ozzYTv85LyT7B7ZVU85KDi23E3lxXn45QHnKqGrCInSBqXN1o36YaXZUWcjxr-qXR1ploSxMN1i7n4hzpsd7CPgpqd4PbAnPO48s_HwzfLmKgBXrZdPob5NrDkE2_lY3pNCO2WCyvN6mvKMvfLR97_JmzvmFWjrNTDEejIA53wsmWirkzY81j2LMiD60cUL8_nZKLthahOM38Vk8SA5s3oWh85IdynA-Z6uoG4WY5Hgj6_QjSu80";

  Future<void> postdata(
    int? id,
  ) async {
    try {
      
      List<Saloon> dummy = [];
      final url = "https://admin.blissme.hk/public/api/servicelist";
      final dio = Dio();
      var formdata =
          FormData.fromMap({"serviceId": id, "page": 1, "limit": 10});
      final responce = await dio.post(url,
          data: formdata, options: Options(headers: {"Authorization": token}));
      final saloondata = responce.data["spa"] as List<dynamic>;

     
      if (saloondata.isEmpty) {
        Saloon newdata = Saloon(
            id: id!,
            serviceid: "0",
            saloonurl: notfound,
            saloonname: "No data found",
            opentime: "0",
            closetime: "0",
            distance: "0",
            bookavailable: "0",
            distanceunit: "0");
        dummy.insert(dummy.length, newdata);
      } else {
        saloondata.forEach((data) {
         

          Saloon newdata = Saloon(
              id: data["id"],
              serviceid: data["serviceId"] ?? "0",
              saloonurl: data["spaImage"] ?? notfound,
              saloonname: data["spaName"] ?? "No data found",
              opentime: data["openTime"] ?? "0",
              closetime: data["closeTime"] ?? "0",
              distance: data["distance"] ?? "0",
              bookavailable: data["bookAvailabl"] ?? "0",
              distanceunit: data["distanceUnit"] ?? "0");
          

          dummy.insert(dummy.length, newdata);
        });
      }

      _items = dummy;

    
    } catch (e) {
      
    }
    notifyListeners();
  }

  Future<void> getalldata() async {
    List<Saloon> listodata = [];
    final url = "https://admin.blissme.hk/public/api/servicelist";
    final dio = Dio();
    if (serviceid.isEmpty) {
      _items = [];
    } else {
      serviceid.forEach((element) {
        var formdata =
            FormData.fromMap({"serviceId": element, "page": 1, "limit": 10});
        final responce = dio
            .post(url,
                data: formdata,
                options: Options(headers: {"Authorization": token}))
            .then((value) {
          final newdata = value.data["spa"] as List<dynamic>;
          if (newdata.isEmpty) {
            Saloon newdata = Saloon(
                id: element,
                serviceid: "0",
                saloonurl: notfound,
                saloonname: "No data found",
                opentime: "0",
                closetime: "0",
                distance: "0",
                bookavailable: "0",
                distanceunit: "0");
            if (newdata.saloonurl == notfound) {
              return;
            } else {
              listodata.insert(listodata.length, newdata);
            }
          } else {
            newdata.forEach((data) {
           

              Saloon newdata = Saloon(
                  id: data["id"],
                  serviceid: data["serviceId"] ?? "0",
                  saloonurl: data["spaImage"] ?? notfound,
                  saloonname: data["spaName"] ?? "No data found",
                  opentime: data["openTime"] ?? "0",
                  closetime: data["closeTime"] ?? "0",
                  distance: data["distance"] ?? "0",
                  bookavailable: data["bookAvailabl"] ?? "0",
                  distanceunit: data["distanceUnit"] ?? "0");
             
              if (newdata.saloonurl == notfound) {
                return;
              } else {
                listodata.insert(listodata.length, newdata);
              }
            });
          }
        });
      });
    }
    _items = listodata;
    notifyListeners();
  }

  Future<void> gettingdata() async {
    try {
      List servicedummy = [];
      final url = "https://admin.blissme.hk/public/api/services";
      final dio = Dio();
      final responce = await dio.get(url,
          options: Options(headers: {"Authorization": token}));
      final getdata = responce.data as Map<String, dynamic>;
      final servicedata = getdata["services"] as List<dynamic>;

      servicedata.forEach((data) {
        servicedummy.add(data["serviceId"]);
       
      });

      serviceid = servicedummy;

    
    } catch (e) {}

    notifyListeners();
  }
}
