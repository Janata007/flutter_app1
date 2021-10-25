// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountDto _$AccountDtoFromJson(Map<String, dynamic> json) => AccountDto(
      pharmacy: json['pharmacy'] == null
          ? null
          : PharmacyDto.fromJson(json['pharmacy'] as Map<String, dynamic>),
      description: json['description'] as String?,
      id: json['id'] as String?,
      lastName: json['lastName'] as String?,
      firstName: json['firstName'] as String?,
      login: json['login'] as String?,
      email: json['email'] as String?,
      enabled: json['enabled'] as bool?,
      facsimileForRealization: json['facsimileForRealization'] as int?,
      facsimilePassword: json['facsimilePassword'] as String?,
      facsimilePharmacist: json['facsimilePharmacist'] as int?,
      facsimileUsername: json['facsimileUsername'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$AccountDtoToJson(AccountDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'login': instance.login,
      'password': instance.password,
      'email': instance.email,
      'enabled': instance.enabled,
      'firstName': instance.firstName,
      'description': instance.description,
      'lastName': instance.lastName,
      'facsimilePharmacist': instance.facsimilePharmacist,
      'facsimileForRealization': instance.facsimileForRealization,
      'facsimileUsername': instance.facsimileUsername,
      'facsimilePassword': instance.facsimilePassword,
      'pharmacy': instance.pharmacy,
    };
