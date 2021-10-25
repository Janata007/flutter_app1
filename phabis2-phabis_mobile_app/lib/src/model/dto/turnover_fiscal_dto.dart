import 'package:json_annotation/json_annotation.dart';
import 'package:ss/src/model/dto/turnover_dto.dart';

import '../enum/document_type.dart';

part 'turnover_fiscal_dto.g.dart';

@JsonSerializable()
class TurnoverFiscalDto extends TurnoverDto {
  String? stornDocumentNumber;
  double? retailPrice; //maloprodazna cena so DDV
  double? retailAmount; //maloprodazen iznos so DDV
  double? vatRetailAmount; //iznos na DDV za maloprodazba
  double? fzoRefPricePc; // FZO referentna cena bez DDV po parce na pakuvanje
  double? fzoRefPricePcWithVat; // FZO referentna cena so DDV po parce na pakuvanje
  double? bureauWholesalePrice;  //Golemoprodazna cena na Biro za lekovi bez DDV
  double? bureauRetailPrice; //Maloprodazna cena na Biro za lekovi bez DDV
  double? fzoReferentPriceMargin; //po skala za skalesta marza na referentna cena na FZO
  double? surcharge; //Za doplata Razlika od golemoprodaznata cena na Biro za lekovi so DDV i referentna cena na FZO so DDV
  double? participation;  //vrednost za naplata vo slucam osloboduvanje od participacija
  double? fzoRefPrice; //FZO referentna cena bez DDV po pakuvanje
  double? calculatedParticipation;
  String? fiscalRegisterNumber; //broj na fiskalna kasa
  double? discount; //popust pri prodazba vo procenti
  double? tenderPrice; //posledna nabavma cena
  bool? hiddenProduct;
  bool? successFiscal;

  //ClosureReportDto closureReport;

  TurnoverFiscalDto({
    this.retailPrice,
    this.fzoRefPrice,
    this.discount,
    this.vatRetailAmount,
    this.tenderPrice,
    this.surcharge,
    this.successFiscal,
    this.stornDocumentNumber,
    this.retailAmount,
    this.participation,
    this.hiddenProduct,
    this.fzoRefPricePcWithVat,
    this.fzoRefPricePc,
    this.fzoReferentPriceMargin,
    this.fiscalRegisterNumber,
    this.calculatedParticipation,
    this.bureauWholesalePrice,
    this.bureauRetailPrice,
  });

  factory TurnoverFiscalDto.fromJson(Map<String, dynamic> data) =>
      _$TurnoverFiscalDtoFromJson(data);

  Map<String, dynamic> toJson() => _$TurnoverFiscalDtoToJson(this);
}
