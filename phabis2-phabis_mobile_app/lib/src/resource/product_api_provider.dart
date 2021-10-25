import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ss/src/model/dto/productdto.dart';
import 'package:ss/src/resource/data.dart';
import 'package:ss/src/resource/paging_util.dart';

import 'network_util.dart';

class ProductApiProvider {
  static final Options options =
      Options(contentType: ContentType.parse("application/json"));

  Future<PageResponse<ProductDto>> fetchProducts(
      ProductDto productDto, int first, int rows) async {
    LazyLoadEvent lazyLoadEvent = LazyLoadEvent(first, rows);

    PageRequestByExample req = PageRequestByExample(productDto, lazyLoadEvent);

    return await NetworkUtil.internal()
        .post(productListUrl, data: req, options: options)
        .then((Response response) {
      print(response);
      var statusCode = response.statusCode;
      if (statusCode == null || statusCode < 200 || statusCode > 400) {
        throw new Exception("Не може да се добијат податоци од серверот");
      }
      var data = response.data;

      List content = data["content"];
      List<ProductDto> products = [];
      for (int i = 0; i < content.length; i++) {
        ProductDto productDto = ProductDto.fromJson(content[i]);
        products.add(productDto);
      }

      return PageResponse<ProductDto>(
          data["totalPages"], data["totalElements"], products!);
    });
  }

  Future<List<ProductDto>> autocompleteProduct(String pattern) async {
    if (pattern.length <= 2) {
      return [];
    }
    PageAutocomplete query = PageAutocomplete(pattern, 20);

    return await NetworkUtil.internal()
        .post(productCompleteUrl,
            data: query,
            options:
                Options(contentType: ContentType.parse("application/json")))
        .then((Response response) {
      var data = response.data; //List<dynamic>

      List<ProductDto> products = [];

      for (int i = 0; i < data.length; i++) {
        ProductDto product = ProductDto.fromJson(data[i]);
        products.add(product);
      }
      return products;
    });
  }
}
