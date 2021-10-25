import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:ss/src/model/dto/invoicedto.dart';
import 'package:ss/src/model/dto/productdto.dart';
import 'package:ss/src/model/dto/turnover_fiscal_reimbursement_dto.dart';
import 'package:ss/src/model/enum/product_type.dart';
import 'package:ss/src/model/enum/turnover_type.dart';
import 'package:ss/src/resource/paging_util.dart';
import 'package:ss/src/resource/product_api_provider.dart';

import 'fiscal_api_provider.dart';
import 'network_util.dart';

//URLs
/*const String tokenUrl =
    "https://artemisoft.dyndns-work.com/phabis2-login/oauth/token";
 */
const String invoiceListUrl = "/phabis2-turnover/api/turnoverInvoice/page";
const String logoutUrl = "";
const String partnerCompleteUrl = "/phabis2-product/api/partner/complete";
const String productCompleteUrl = "/phabis2-product/api/product/complete";

const String loginUrl = baseUrl + "/phabis2-login/oauth/token";
const String baseUrl = 'https://artemisoft.dyndns-work.com:8443';
const String fiscalListUrl =
    "/phabis2-turnover/api/turnoverFiscalReimbursement/page";
const String productListUrl = "/phabis2-product/api/product/page";
const String fiscalCompleteUrl =
    "/phabis2-turnover/api/turnoverFiscal/complete";
const String loggedInPharmacyUrl =
    "https://artemisoft.dyndns-work.com:8443/phabis2-login/api/account/pharmacy";
const String loggedInPharmaciesUrl = "/phabis2-login/api/account/pharmacies";

//TOKEN RESOURCES
String username = 'phabisjwtclientid';
String password = 'XY7kmzoNzl100';
String basicAuth = 'Basic ' + base64Encode(utf8.encode('$username:$password'));

Map<String, String> headers = {
  'Content-Type': 'application/x-www-form-urlencoded',
  'Accept': 'application/json',
  'Authorization': basicAuth
};

Map<String, String> body = {
  'grant_type': "password",
  'password': "admin1",
  'username': "admin"
};
String mainToken = '';
var padding = const Padding(padding: EdgeInsets.all(12));

//FOR INVOICE LIST
Future<List<Invoice>> getInvoicesResult(Invoice inv) async {
  PageResponse<Invoice> response = await fetchDataForInvoice(inv);
  return response.content;
}

Future<PageResponse<Invoice>> fetchDataForInvoice(Invoice inv) async {
  return apiProvider.fetchInvoices(inv, 0, 50);
}

//FOR FISCAL REIMBURSEMENT LIST
FiscalApiProvider fiscalApiProvider = FiscalApiProvider();

Future<List<TurnoverFiscalReimbursementDto>> getFiscalResult(
    TurnoverFiscalReimbursementDto fiscalDto) async {
  PageResponse<TurnoverFiscalReimbursementDto> response =
      await fetchDataForFiscal(fiscalDto);
  return response.content;
}

Future<PageResponse<TurnoverFiscalReimbursementDto>> fetchDataForFiscal(
    TurnoverFiscalReimbursementDto fiscalDto) async {
  return fiscalApiProvider.fetchFiscals(fiscalDto, 0, 20);
}

//FOR PRODUCT DTO LIST
ProductApiProvider productApiProvider = ProductApiProvider();

Future<List<ProductDto>> getProductResult(ProductDto productDto) async {
  PageResponse<ProductDto> response = await fetchDataForProduct(productDto);
  return response.content;
}

Future<PageResponse<ProductDto>> fetchDataForProduct(
    ProductDto productDto) async {
  return productApiProvider.fetchProducts(productDto, 0, 20);
}

//TURNOVER TYPE CHECK
TurnoverType stringToTurnoverType(String typeName) {
  if (typeName.startsWith('Комерцијална продажба')) {
    return TurnoverType.C;
  } else if (typeName.startsWith('Со партиципација')) {
    return TurnoverType.R;
  } else {
    return TurnoverType.O;
  }
}
//PRODUCT TYPE CHECK
ProductType stringToProductType(String typeName) {
  if (typeName.startsWith('Commercial')) {
    return ProductType.C;
  } else {
    return ProductType.L;
  }
}
