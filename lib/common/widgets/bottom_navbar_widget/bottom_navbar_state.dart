import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bottom_navbar_state.g.dart';

@riverpod
class BottomNavbarState extends _$BottomNavbarState {
  @override
  int build() => 0;

  void setIndex(int index) => state = index;
}
