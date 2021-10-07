import 'package:laravel/model/services.dart';

class Saloon {
  final int? id;
  final String? serviceid;
  final String? saloonurl;
  final String? saloonname;
  final String? opentime;
  final String? closetime;
  final String? distance;
  final String? bookavailable;
  final String? distanceunit;

  Saloon(
      {
    required  this.id,
    required  this.serviceid,
    required  this.saloonurl,
    required  this.saloonname,
    required  this.opentime,
    required  this.closetime,
    required  this.distance,
    required  this.bookavailable,
    required  this.distanceunit});
}
