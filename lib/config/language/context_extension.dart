import 'package:flutter/widgets.dart';
import 'package:easy_localization/easy_localization.dart';

extension LocalizationContextExtension on BuildContext {
  String tr(String key) => key.tr();

  /// Optional: plural 지원
  String plural(String key, num value) => key.plural(value);

  /// Optional: args 전달
  String trWithArgs(String key, List<String> args) => key.tr(args: args);

  /// Optional: namedArgs 전달
  String trWithNamedArgs(String key, Map<String, String> namedArgs) =>
      key.tr(namedArgs: namedArgs);
}
