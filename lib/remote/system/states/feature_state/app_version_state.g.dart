// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_version_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppVersionStateImpl _$$AppVersionStateImplFromJson(
        Map<String, dynamic> json) =>
    _$AppVersionStateImpl(
      os: json['os'] as String? ?? '',
      version: json['version'] as String? ?? '',
      isForce: json['isForce'] as bool? ?? false,
    );

Map<String, dynamic> _$$AppVersionStateImplToJson(
        _$AppVersionStateImpl instance) =>
    <String, dynamic>{
      'os': instance.os,
      'version': instance.version,
      'isForce': instance.isForce,
    };
