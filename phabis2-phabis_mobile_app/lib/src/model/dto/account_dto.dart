
import 'package:json_annotation/json_annotation.dart';
import 'package:ss/src/model/dto/pharmacy_dto.dart';

part 'account_dto.g.dart';

@JsonSerializable()
class AccountDto {
   String? id;
   String? login;
   String? password;
   String? email;
   bool? enabled;
   String? firstName;
   String? description;
   String? lastName;
   //Role role;
   int? facsimilePharmacist;
   int? facsimileForRealization;
   String? facsimileUsername;
   String? facsimilePassword;
   PharmacyDto? pharmacy;

AccountDto({this.pharmacy, this.description, this.id, this.lastName, this.firstName, this.login, this.email, this.enabled, this.facsimileForRealization, this.facsimilePassword,
this.facsimilePharmacist, this.facsimileUsername, this.password});

   factory AccountDto.fromJson(Map<String, dynamic> data) =>
       _$AccountDtoFromJson(data);

   Map<String, dynamic> toJson() => _$AccountDtoToJson(this);


}
