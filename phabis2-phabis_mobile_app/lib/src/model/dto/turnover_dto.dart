import 'package:json_annotation/json_annotation.dart';

import '../enum/document_type.dart';

@JsonSerializable()
class TurnoverDto {
  String? id;
  String? documentNumber;
  String? documentDate;
  double? quantity; //kolicina na artiklot vo dadenta transakcija
  double? vatRate; //procent za DDV
  double?
      divide; //delba na artikal, commercial_divide ili reimbursement_divide od product tabela
  bool? confirmed;
  double?
      groupTotal; //The group total for the whole group of transactions (turnovers) that share the same document_type and document_number.
  bool?
      groupTopRecord; //Prviot rekord vo edna grupa. Edna grupa ima zaednicki document_type, document_number, confirmed i group_total

  //Instant createDate;

  List<DocumentType>? filterDocumentTypes;
  String? filterStartDate;
  String? filterEndDate;

  TurnoverDto({
    this.quantity,
    this.documentNumber,
    this.id,
    this.documentDate,
    this.vatRate,
    this.divide,
    this.groupTotal,
    this.filterDocumentTypes,
    this.filterStartDate,
    this.filterEndDate,
    this.confirmed,
    this.groupTopRecord,
  });
}
