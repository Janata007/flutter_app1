import 'package:json_annotation/json_annotation.dart';
import 'package:ss/src/model/dto/pharmacy_dto.dart';
import 'package:ss/src/model/dto/productdto.dart';
import 'package:ss/src/model/dto/turnover_fiscal_dto.dart';

import '../enum/document_type.dart';
import '../enum/dto_type.dart';
import '../enum/payment_type.dart';
import '../enum/turnover_type.dart';
import 'account_dto.dart';

part 'turnover_fiscal_reimbursement_dto.g.dart';

@JsonSerializable()
class TurnoverFiscalReimbursementDto extends TurnoverFiscalDto{
   int? issuedDrugFzoCode; //FZO sifra na lekot
   String? hicNumber; //broj na zdravstvena legitimacija
   String? embg; //embg na pacientot
   String? ezbo; //ezbo broj na pacientot
   String? employerRegNumber; //registraciski broj na rabotodavacot preku koj liceto e osigureno
   String? embgHolder; //embg na osigurenikot
   String? ezboHolder; //ezbo na osigurenikot (broj na elektronskata zdravstvena karticka)
   String? municipalityCode; //sifra na opstia na osigurenikot
   String? prescriptionNumber; //broj na recept
   String? prescriptionDate; //datum na izdavanje na recept
   String? prescriptionDrugIssueDate; //datum na recept na izdavanje vo apteka
   String? therapyType; //1-Narkotika, 2-Akutna, 3-Hronicna
   int? participationType; //0-Plakja,1-Specijalni potrebi, 2-Transplantacija
   String? pharmacyFzoCode; //fzo sifra na aptekata
   bool? foreigner; //true ako osigurenikot e stranec
   String? allergies;
   String? hic3RegionalService;
   String? validityDateChronicTherapy; //datum na validnost na recept prepisan za hronicna terapija
   String? insuranceValidityDate; //datum na validnost na osiguruvanje na pacientot/osigurenikot
   bool? expensive;
  // Instant realizationTime;
   String? yearMonth;
   String? invoiceNumber;
   int? specificationRank;
   String? specificationType; //EXPENSIVE, EMERGENCY, FOREIGNER, NOSURCHARGE, OTHER.
   int? specificationNumber;
   int? prescriptionSerialNumber;
   bool? disabled;
   String? dirtyId;
   int? facsimileRealization;
   bool? vip;
   String? firstName; //ime na pacient
   String? lastName; //prezime na pacient
   bool? issuedToNonPatient; //lekot ne e podignat od pacientot
   String? issuedToNonPatientEmbg; //embg na toj sto go podignal
  //DoctorDto facsimilePhysician;
   //DoctorDto facsimileSpecialist1;
   //DoctorDto facsimileSpecialist2;
   //DoctorDto facsimileSpecialist3;
   //RegionalServiceDto regionalService;
   //DoctorDto facsimileRural;
   //InsuranceTypeDto insuranceType;
   //DoctorDto facsimileEmergencyService;
   //DiagnoseDto diagnose;
   DtoType? dtoType;
   PaymentType? paymentType;
   TurnoverType? turnoverType;
   DocumentType? documentType;

   ProductDto? product;
   AccountDto? account;
   PharmacyDto? pharmacy;

   TurnoverFiscalReimbursementDto({this.product, this.pharmacy, this.account, this.documentType, this.turnoverType, this.paymentType, this.firstName, this.allergies, this.dirtyId, this.disabled, this.embg, this.embgHolder, this.employerRegNumber, this.expensive,
   this.ezbo, this.ezboHolder, this.facsimileRealization, this.foreigner, this.hic3RegionalService, this.hicNumber, this.insuranceValidityDate,
   this.invoiceNumber, this.issuedDrugFzoCode, this.issuedToNonPatient, this.issuedToNonPatientEmbg, this.lastName, this.municipalityCode, this.participationType,
   this.pharmacyFzoCode, this.prescriptionDate, this.prescriptionDrugIssueDate, this.prescriptionNumber, this.prescriptionSerialNumber, this.specificationNumber,
   this.specificationRank, this.specificationType, this.therapyType, this.validityDateChronicTherapy, this.vip, this.yearMonth, this.dtoType});

   factory TurnoverFiscalReimbursementDto.fromJson(Map<String, dynamic> data) =>
       _$TurnoverFiscalReimbursementDtoFromJson(data);

   Map<String, dynamic> toJson() => _$TurnoverFiscalReimbursementDtoToJson(this);


}