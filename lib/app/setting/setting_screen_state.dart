import 'package:naamk_wallet/app/setting/setting_screen_ui_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'setting_screen_state.g.dart';

@riverpod
class SettingScreenState extends _$SettingScreenState {
  @override
  SettingScreenUiModel build() {
    return const SettingScreenUiModel(showLanguageCard: false);
  }

  void setShowLanguageCard(bool show) {
    state = state.copyWith(showLanguageCard: show);
  }
}
