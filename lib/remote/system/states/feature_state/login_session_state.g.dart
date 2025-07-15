// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_session_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginSessionStateImpl _$$LoginSessionStateImplFromJson(
        Map<String, dynamic> json) =>
    _$LoginSessionStateImpl(
      userId: json['userId'] as String? ?? '',
      sessionExpired: json['sessionExpired'] as bool? ?? false,
    );

Map<String, dynamic> _$$LoginSessionStateImplToJson(
        _$LoginSessionStateImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'sessionExpired': instance.sessionExpired,
    };
