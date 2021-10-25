import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:ss/src/model/dto/invoicedto.dart';
import 'package:ss/src/model/dto/partnerdto.dart';
import 'package:ss/src/resource/paging_util.dart';
import 'package:ss/src/resource/data.dart';

import 'network_util.dart';

class InvoiceApiProvider {
  static final Options options =
      Options(contentType: ContentType.parse("application/json"));

  Future<PageResponse<Invoice>> fetchInvoices(
      Invoice invoice, int first, int rows) async {
    LazyLoadEvent lazyLoadEvent = LazyLoadEvent(first, rows);

    PageRequestByExample req = PageRequestByExample(invoice, lazyLoadEvent);

    return await NetworkUtil.internal()
        .post(invoiceListUrl, data: req, options: options)
        .then((Response response) {
      var statusCode = response.statusCode;
      if (statusCode == null || statusCode < 200 || statusCode > 400) {
        throw new Exception("Не може да се добијат податоци од серверот");
      }
      var data = response.data;

      List content = data["content"];
      List<Invoice> invoices = [];
      for (int i = 0; i < content.length; i++) {
        Invoice invoice = Invoice.fromJson(content[i]);
        invoices.add(invoice);
      }

      return PageResponse<Invoice>(
          data["totalPages"], data["totalElements"], invoices!);
    });
  }

  Future<List<PartnerDto>> autocompletePartner(String pattern) async {
    if (pattern.length <= 2) {
      return [];
    }
    PageAutocomplete query = PageAutocomplete(pattern, 20);

    return await NetworkUtil.internal()
        .post(partnerCompleteUrl,
            data: query,
            options:
                Options(contentType: ContentType.parse("application/json")))
        .then((Response response) {
      var data = response.data; //List<dynamic>

      List<PartnerDto> partners = [];

      for (int i = 0; i < data.length; i++) {
        PartnerDto partner = PartnerDto.fromJson(data[i]);
        partners.add(partner);
      }
      return partners;
    });
  }
}
