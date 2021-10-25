import 'package:json_annotation/json_annotation.dart';
import 'package:ss/src/model/dto/partnerdto.dart';

import '../enum/packaging_type.dart';
import '../enum/product_type.dart';

part 'productdto.g.dart';

@JsonSerializable()
class ProductDto{
   String? id;
   int? fzoProductCode;
   String? productName;
   bool? active;
   String? startActiveDate;
   String? endActiveDate;
   String? manufacturerProductName;
   double? vatRate;
   ProductType? productType;
   PackagingType? packagingType;
   int? packagingValue;
   double? piecesPerPackage;
   double? packagesPerBox;
   double? commercialDivide;
   String? fzoProductName;
   //ProductCategoryType productCategoryType;
   String? genericName;
   String? atc7;
   String? atc10;
   String? description;
   String? productCode;
   int? uplId;
   bool? domesticProduct;
   bool? validated;
   String? phoenixCode;
   String? mlCode;
   String? integralCode;
   String? eurolekCode;
   int? warrantyMonths;
   PartnerDto? manufacturer;
   PartnerDto? supplier;
  // ProductPriceDto price;
  // ProductStockDto stock;

   //List<BarcodeDto> barcodes;

   String? outputManufacturerName;
   double? outputStockCommQty;
   double? outputRetailPrice;
   double? outputTenderPrice;
   double? outputFzoRefPrice;

   ProductDto({this.vatRate, this.id, this.active, this.atc7, this.atc10, this.commercialDivide, this.description, this.domesticProduct, this.endActiveDate,
   this.eurolekCode, this.fzoProductCode, this.fzoProductName, this.genericName, this.integralCode, this.manufacturer, this.manufacturerProductName,
   this.mlCode, this.outputFzoRefPrice, this.outputManufacturerName, this.outputRetailPrice, this.outputStockCommQty, this.outputTenderPrice, this.packagesPerBox,
   this.packagingType, this.packagingValue, this.phoenixCode, this.piecesPerPackage, this.productCode, this.productName, this.productType, this.startActiveDate,
   this.supplier, this.uplId, this.validated, this.warrantyMonths});

   factory ProductDto.fromJson(Map<String, dynamic> data) =>
       _$ProductDtoFromJson(data);

   Map<String, dynamic> toJson() => _$ProductDtoToJson(this);

}