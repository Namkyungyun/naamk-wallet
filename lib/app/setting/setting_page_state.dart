import 'package:naamk_wallet/app/setting/setting_page_ui_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'setting_page_state.g.dart';

@riverpod
class SettingPageState extends _$SettingPageState {
  @override
  SettingPageUiModel build() {
    return const SettingPageUiModel(showLanguageCard: false);
  }

  void setShowLanguageCard(bool show) {
    state = state.copyWith(showLanguageCard: show);
  }
}
