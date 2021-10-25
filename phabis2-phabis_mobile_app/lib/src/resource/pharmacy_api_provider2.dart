import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:ss/src/model/dto/pharmacy_dto.dart';
import 'package:ss/src/resource/data.dart';
import 'package:ss/src/resource/paging_util.dart';

import 'data.dart';
import 'network_util.dart';

class PharmacyApiProvider2 {
  static final Options options =
      Options(contentType: ContentType.parse("application/json"));

  Map<String, String> header = {
    'Content-Type': 'application/json',
    'X-TenantId': 'local',
    'Authorization': 'Bearer ' + mainToken
  };

  Future<List<PharmacyDto>> fetchPharmacy() async {
    var response = await http.get(
      Uri.parse(loggedInPharmacyUrl),
      headers: header,
    );
    Map<String, dynamic> jsonData =
        jsonDecode(response.body) as Map<String, dynamic>;

    String id = jsonData['id'].toString();
    String pharmacyName = jsonData['pharmacyName'].toString();
    String city = jsonData['city'].toString();
    String address = '';
    if (jsonData['address'] != null) {
      address = jsonData['address'].toString();
    }
    String healthFacilityCode = '';
    if (jsonData['healthFacilityCode'] != null) {
      healthFacilityCode = jsonData['healthFacilityCode'].toString();
    }
    String vatNumber = '';
    if (jsonData['vatNumber'] != null) {
      vatNumber = jsonData['vatNumber'].toString();
    }

    PharmacyDto pharmacy = PharmacyDto();
    pharmacy.pharmacyName = pharmacyName;
    pharmacy.id = int.parse(id);
    pharmacy.city = city;
    pharmacy.address = address;
    if (!healthFacilityCode.isEmpty) {
      pharmacy.healthFacilityCode = int.parse(healthFacilityCode);
    }
    pharmacy.vatNumber = vatNumber;

    List<PharmacyDto> list = [];
    list.add(pharmacy);

    return list;
  }

  Future<PageResponse<PharmacyDto>> fetchPharmacies() async {
    return await NetworkUtil.internal()
        .post(loggedInPharmaciesUrl, options: options)
        .then((Response response) {
      var statusCode = response.statusCode;
      if (statusCode == null || statusCode < 200 || statusCode > 400) {
        throw new Exception("Не може да се добијат податоци од серверот");
      }
      var data = response.data;

      List content = data["content"];
      List<PharmacyDto> pharmacies = [];
      for (int i = 0; i < content.length; i++) {
        PharmacyDto pharmacyDto = PharmacyDto.fromJson(content[i]);
        pharmacies.add(pharmacyDto);
      }

      return PageResponse<PharmacyDto>(
          data["totalPages"], data["totalElements"], pharmacies);
    });
  }
}
