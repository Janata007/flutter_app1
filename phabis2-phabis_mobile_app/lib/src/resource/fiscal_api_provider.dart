import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ss/src/model/dto/turnover_fiscal_reimbursement_dto.dart';
import 'package:ss/src/resource/data.dart';
import 'package:ss/src/resource/paging_util.dart';

import 'network_util.dart';

class FiscalApiProvider {
  static final Options options =
      Options(contentType: ContentType.parse("application/json"));

  Future<PageResponse<TurnoverFiscalReimbursementDto>> fetchFiscals(
      TurnoverFiscalReimbursementDto fiscalDto, int first, int rows) async {
    LazyLoadEvent lazyLoadEvent = LazyLoadEvent(first, rows);

    PageRequestByExample req = PageRequestByExample(fiscalDto, lazyLoadEvent);

    return await NetworkUtil.internal()
        .post(fiscalListUrl, data: req, options: options)
        .then((Response response) {
      print(response);
      var statusCode = response.statusCode;
      if (statusCode == null || statusCode < 200 || statusCode > 400) {
        throw new Exception("Не може да се добијат податоци од серверот");
      }
      var data = response.data;

      List content = data["content"];
      List<TurnoverFiscalReimbursementDto> fiscals = [];
      for (int i = 0; i < content.length; i++) {
        TurnoverFiscalReimbursementDto fiscalDto =
            TurnoverFiscalReimbursementDto.fromJson(content[i]);
        fiscals.add(fiscalDto);
      }

      return PageResponse<TurnoverFiscalReimbursementDto>(
          data["totalPages"], data["totalElements"], fiscals!);
    });
  }
}
