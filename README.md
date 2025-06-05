# naamk_wallet

proto type wallet

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

-  [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
-  [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Directory branch point

lib의 하위 디렉토리 분기 기준

```
lib/
├── ui/                            ← 앱에서의 page group 디렉토리
│   └── dashboard/                   ← 화면별 디렉토리
│       ├── dashboard_view.dart        ← ui
│       └── dashboard_viewmodel.dart   ← ui action logic
│   └── root_view.dart                 ← 최상단 ui
│   └── root_viewmodel.dart            ← 최상단 ui action logic
│
├── common/                        ← 공통 사용 디렉토리
│   ├── utils/                        ← ui action util 디렉토리
│   └── widgets/                      ← ui 공통 컴포넌트 디렉토리
│
├── config/                        ← app, core 설정 디렉토리
│   └── base/                         ← ui action util 디렉토리
│       ├── base_exception_entity.dart    ← 기본 exception 구조
│       ├── base_state.dart               ← network요청에 필요한 state기본 구조
│       └── base_viewmodel.dart           ← ui action logic 기본 구조
│   ├── di/                           ← ViewModel, Service, Repository 주입
│   ├── language/                     ← 언어 파일
│   ├── route/                        ← router 설정
│   └── theme/                        ← 테마 설정 (폰트, 색상)
│
├── core/                          ← 데이터 처리 부분 디렉토리
│   ├── constants/                    ← 상수데이터 ( + Enum )
│   ├── exception/                    ← api, local 데이터 처리 공통 Exception
│   ├── local/                        ← 앱내 저장데이터 정의 및 처리 디렉토리
│   └── remote/                       ← api 처리 디렉토리
│       ├── config/                     ← api 설정 하는 dio파트 설정 디렉토리
│       ├── domain/                     ← ui에서 이벤트 전달점인 interface 디렉토리
│       └── ${feature}/               ← ui에서 이벤트 전달점인 interface 디렉토리
│           ├── repository/             ← api 'interface' > 필요인자는 주입만 받음 (구현체 은닉)
│           ├── usecase/                ← api 'interface'인 repository 호출.
│           ├── req_dto/                ← api request data
│           ├── res_dto/                ← api response data
│           └── ui_dto/                 ← ui response data
│
└── main.dart
```

## Using Libarary

```
// 상태관리
riverpod
flutter_riverpod
getit

// navigation
go_router

// network
dio
retrofit
retrofit_generator

// local data
flutter_secure_stroage
shared_preferences

// 날짜, 숫자, 다국어 처리
easy_localization

// 환경설정
device_info_plus
package_info_plus
flutter_dotenv

// ui component
toggle_switch
fluttertoast
flutter_svg
lottie
cached_network_image
infinite_scroll_pagination
url_launcher
flutter_local_notifications

// theme
google_fonts

// test
mockito

// log
logger

```

## APP 기본 프레임 설정

### splash 설정

flutter_native_splash libarary를 이용

-  기존 splash설정이 되어져 있던 상태

```
flutter clean
dart run flutter_native_splash:remove
```

-  512x512 이미지 파일 splash로 사용될 이미지 준비
-  assets/images/ 디렉토리에 이미지 넣기
-  flutter_native_splash.yaml 파일에서 해당 이미지 경로 적용
-  명령어를 통해 flutter_native_splash 설정 새로 적용되도록 하기

```
dart run flutter_native_splash:create
```

-  변경된 스플래시의 이미지들이 아래의 경로 내에 생겼는지 확인

```
android/app/src/main/res/drawable-*/
```

-  주의할 점
   Flutter 2.8 이후, 그리고 Android 12부터 시스템 스플래시 동작 방식이 바뀌었기 때문에,

flutter_native_splash를 정상 설정해도 Android 12 이상에서는
스플래시로 mipmap/ic_launcher.png가 먼저 노출되는 것처럼 보이는 현상 발생

🔹 Android 12+에서의 Splash 처리 방식
Android 12(API 31+)부터 시스템은 앱이 시작될 때:

자동으로 windowSplashScreenAnimatedIcon 속성에 지정된 이미지를 사용

해당 값이 없거나 설정이 잘못되었으면 → 기본으로 ic_launcher를 사용함!

즉, 'flutter_native_splash.yaml' 파일에서의 android_12파트의 Image설정은 반드시 해주어야 함.

### launcher icon 설정

flutter_launcher_icons libarary를 이용

-  이미지 준비

   -  512x512 배경 색상 이미지 (ic_launcher_background.png)
   -  512x512 로고 이미지 (ic_launcher_foreground.png)
   -  512x512 로고+배경 이미지 (ic_launcher.png)

-  설정 config파일 자동생성되게 cmd 실행

   -  flutter_launcher_icons.yaml 파일이 생성되는 명령어

```
dart run flutter_launcher_icons:generate
```

-  flutter_launcher_icons.yaml 파일에 설정된 값으로 launcher 자동 생성 진행

```
dart run flutter_launcher_icons -f flutter_launcher_icons.yaml
```

## theme 설정

**1. 의존 library**

```
* get_it
* shared_preferences
* freezed, freezed_annotation
* riverpod, flutter_riverpod, riverpod_annotation, riverpod_generator, hooks_riverpod
```

**2. initialization injection**
app initialization 시, local storage인 shared_preferences에 저장된 값을 가져와야하므로,
get_it을 이용해 shared_preferences를 초기 injection 진행.

-  injector.dart와 inject_local_module.dart에서 주입 확인가능

**3. theme property class**
app_theme.dart에서 lightTheme, darkTheme 케이스로 나누어 ThemeData를 정의

-  ThemeData에서의 appBarTheme, listTileTheme, carTheme ... 와 같은 요소들을 등록할 경우, 앱 내에서
   AppBar, Card, ListTile등의 widget에 자동으로 theme가 적용됨.

**4. theme color class**
app_theme.dart에서 공통 widget내에 적용될 color를
app_theme.dart에서 lightTheme, darkTheme 케이스로 나누어 정의

**5. 상태관리 생성**
사용자의 설정에 따라 변경되며, 앱 전역에 반영되어야 하므로 Riverpod를 이용한 상태관리 구조를 도입

또한 shared_preferences를 활용해 사용자가 선택한 테마 모드를 디바이스 저장할 수 있도록 함.

_(5-1) ui model 클래스 생성 ( 테마 객체로 사용될 모델 정의 )_
freezed를 사용해 불변 객체 및 'copyWith', '==', 'hashCode' 자동 생성

-  class에 freezed annotation
-  ~.freezed.dart, ~.g.dart 파일이 생성되도록 해당 파일명을 part로 주입.

```
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_theme_ui_model.freezed.dart';
part 'app_theme_ui_model.g.dart';

@freezed
class AppThemeUiModel with _$AppThemeUiModel {
  const factory AppThemeUiModel({
    @Default(ThemeMode.system) ThemeMode themeMode,
  }) = _AppThemeUiModel;

  // freezed의 구현체를 이용해 json 데이터를 AppThemeUiModel 객체로 변환
  factory AppThemeUiModel.fromJson(Map<String, dynamic> json) =>
      _$AppThemeUiModelFromJson(json);
}

```

-  freezed 구현체 파일 자동 생성 명령어

```
dart run build_runner build --delete-conflicting-outputs

or

dart run build_runner watch
```

_(5-2) 상태관리 클래스 생성 ( 상태변경의 저장, 조회, 반영을 담당 )_
riverpod, shared_preferences, ui 모델 이용
타입 안전한 상태관리와 자동 생성된 provider를 어디서든 사용가능므로,
riverpod, flutter_riverpod, riverpod_annotation, riverpod_generator를 이용

-  class에 riverpod annotation을 붙이고, 구현체 자동생성명령어로 만들어진 구현체를 상속받아 사용할 수 있도록 extends \_${추상클래스} 처리
-  ~.g.dart 파일이 생성되도록 해당 파일명을 part로 주입.

   -  'riverpod_annotation'기반의 코드 생성 방식을 통해 보일러플레이트 코드를 줄이고, provider와 notifier를 자동 생성할 수 있음.
   -  '\_$AppThemeState'는 build() 메서드를 포함한 추상클래스로부터 상속되며, 'riverpod_generator'가 처리함.

```
part 'app_theme_state.g.dart';

AppThemeUiModel build() {
  return const AppThemeUiModel(themeMode: ThemeMode.system);
}

```

-  riverpod 구현체 파일 자동 생성 명령어

```
dart run build_runner build --delete-conflicting-outputs

or

dart run build_runner watch
```

_(5-3) 상태 값 가져오기 & 상태 값 변경하기_
build메서드에서는 이전에 구현한 uiModel이 반환타입이되도록하며, 초기 shared_preferences를 앱 기동시 등록한 injector를 이용해 저장소를 부름.

-  상태값 가져오기
   -  injector를 이용한 호출방식 'final prefs = injector<SharedPreferences>();', key를 이용해 기기에 저장된 값을 가져옴.

```
  @override
  AppThemeUiModel build() {
    ThemeMode themeMode = ThemeMode.system;
    final prefs = injector<SharedPreferences>();
    final savedThemeMode = prefs.getString(THEME_MODE) ?? 'ThemeMode.system';

    themeMode = findThemeMode(savedThemeMode);
    return AppThemeUiModel(themeMode: themeMode);
  }
```

-  상태값 변경하기
   -  shared_preferences에 먼저 값을 저장 시킴 (위와 같이 injector를 이용해 sharedPreferences 객체를 정의)
   -  자동 생성된 notifier의 구현체는 'state'는 ui model의 값이므로, freezed에서 만들어진 ui model구현체의 copyWith를 이용해 기존 고유값을 그대로 가져오고, 변경하고자 하는 값의 일부만 넣어 state를 갱신시켜 상태변화를 일으킴.

```
  void setThemeMode(ThemeMode mode) {
    final prefs = injector<SharedPreferences>();
    prefs.setString(THEME_MODE, mode.toString());

    state = state.copyWith(themeMode: mode);
  }

```

**6. 위젯 연결**
flutter_riverpod library 사용 (ConsumerWidget, ConsumerStatefulWidget, WidgetRef 제공)
flutter_hooks, hooks_riverpod 사용
-> flutter_hooks의 경우
React의 hooks 개념과 유사한 useXXX 함수형 훅들을 Flutter에 도입하기 위한 라이브러리입니다.
useState, useEffect, useTextEditingController, useAnimationController 등 사용 가능.
-> hooks_riverpod의 경우 flutter_hooks + flutter_riverpod을 결합해 HookConsumerWidget 등 커스텀 hook widget 지원

**< 위젯별 사용 경향 비교 [위젯 사용 빈도 (일반적인 프로젝트 기준) 특징 권장 시점] >**

-  ConsumerWidget ⭐⭐⭐⭐☆ (매우 자주 사용)

   -  Flutter 생명주기 활용 x
   -  StatelessWidget 기반의 가장 간단한 Riverpod 소비 위젯 대부분의 단순한 UI 구성

---

-  HookConsumerWidget ⭐⭐⭐⭐⭐ (가장 많이 사용됨)

   -  flutter_hooks의 HookWidget + ConsumerWidget 결합형 TextEditingController, useEffect 등 hook 사용 시

---

-  ConsumerStatefulWidget, ConsumerState ⭐⭐☆☆☆ (특정 상황에만 사용)

   -  flutter lifeCycle 사용 가능
   -  StatefulWidget에서 ref 사용 가능
   -  StatefulWidget + ref initState, dispose, 애니메이션 등 필요 시

---

**< Riverpod에서 위젯이 provider를 구독하고 조작하는 방법 >**
WidgetRef ref는 Riverpod에서 위젯이 provider를 구독하고 조작하기 위한 핵심 객체
ref는 ConsumerWidget, HookConsumerWidget, ConsumerStatefulWidget 등에서 사용되며, 상태 읽기, 상태 변경, 리스너 등록, 라이프사이클 접근 등에 사용.

provider로부터 상태를 불러오고

상태가 변경되면 위젯을 자동으로 갱신하며

비동기 요청, 리스너 등록 등 라이프사이클 기반 로직 제어 가능.

기능 설명

-  ref.watch()
   -  provider의 상태 구독 및 값 읽기 (상태 변경 시 위젯 자동 리빌드)
-  ref.read()
   -  provider의 현재 값 읽기 (구독 X)
   -  버튼 클릭 시 등 이벤트 핸들러에 자주 사용
   ```
   ref.read(themeStateProvider.notifier).setTheme(ThemeMode.dark);
   ```
-  ref.listen()
   -  provider 상태를 변화 감지하여 콜백 실행 (리빌드 없이)
   -  비동기 작업 완료 시, 조건부 UI 로직 분리에 유용
   ```
   ref.listen(themeProvider, (previous, next) {
      if (previous != next) {
         showToast('Theme updated to ${next.themeMode}');
      }
   });
   ```
-  ref.invalidate()
   -  provider를 강제 재실행 (초기화)
   -  provider를 초기화하거나 새로고침할 때 사용
-  ref.onDispose()
   -  provider가 dispose될 때 실행할 clean-up 등록

---

_(6-1) 연관화면_

root_screen.dart
theme_toggle_switch_widget.dart

-  root_screen.dart
   -  MaterialApp의 themeMode 속성에 themeProvider로부터 구독한 값을 적용.
   -  ConsumerWidget을 상속 + build 함수 내에서 WidgetRef로 theme provider의 themeMode값을 관찰하는 watch 추가
   -  MaterialApp을 정의하는 파트의 themeMode에 현재의 themeMode 값을 넘겨줌.
   -  앱 전역에서 테마 변경이 발생하면 최상위 MaterialApp이 자동으로 리빌드되어 전체 테마가 적용됨
-  theme_toggle_switch_widget.dart
   -  사용자의 테마 변경 요청을 ref.read().setThemeMode()를 통해 반영
   -  ConsumerWidget을 상속
   -  build 함수 내에서 WidgetRef로 theme provider의 themeMode값을 읽는 watch 추가
   -  build 함수 내에서 WidgetRef로 theme 상태값을 변경해야하므로, WidgetRef의 read로 변경 로직 호출

## 언어 설정

easy_localization libarary를 이용

**1. 의존 library**

```
* get_it, shared_preferences (사용자경험유지를 위한 shared_preferences & 앱 기동 시 의존성 주입을 위한 get_it)
* freezed, freezed_annotation (uiModel 불변객체(hashCode, ==, copyWith) 및 자동 구현체 생성을 위한 freezed)
* riverpod, riverpod_annotation (uiModel의 값 속성 변화를 구독, 조작 및 자동 구현체 생성을 위한 riverpod)
```

**2. initialization injection**
app initialization 시, local storage인 shared_preferences에 저장된 값을 가져와야하므로,
get_it을 이용해 shared_preferences를 초기 injection 진행.(main.dart에서 앱 기동 전 호출)

-  injector.dart와 inject_local_module.dart에서 주입 확인가능

**3. language type 정의 enum [앱에서 취급할 언어 타입 정의]**
app_language.dart에서 해당 앱에서 다룰 언어를 enum값으로 정의 (언어코드, 국가 코드)
assets/language/ 경로 에서 '{언어코드}-{국가코드}.json'을 생성해 적용시킬 언어에 대한 key,value를 구성해야하므로,
해당 json파일이 있는 경로를 app_language.dart의 변수에 정의 필요.

-  취급 국가,언어 enum값 정의
-  언어팩 파일(json)의 경로를 담은 변수 정의
-  그 외 공통적으로 사용될 함수 정의 (find 함수 + 디폴트 value가 return되도록 고려.)

**4. language uiModel class [구독 및 조작할 불변객체 생성]**
language enum을 반환하는 불변 객체를 구성 + freezed 사용
build_runner library를 이용해 구현체 파일 자동 생성되도록 진행

-  freezed, freezed annotation을 이용해 불변 객체 구성
   -  hashCode, ==, copyWith, 객체 <-> json 기능

```
dart run build_runner build --delete-conflicting-outputs

or

dart run build_runner watch
```

**5. language state class [구독 및 조작을 위한 상태관리 클래스]**
riverpod + riverpod_annotation + riverpod_generator library를 이용하는 불변 객체의 속성값을 상태관리할 클래스 구성

-  상태관리를 위한 notifier, provider 구현체를 자동으로 생성해줌.

di library를 이용해 initailizaion injection된 shared_preferences 저장소를 가져와 key값을 이용해
이전 사용자의 경험유지 값을 조회 (기기의 앱에 저장된 언어값)

build_runner library를 이용해 구현체 파일 자동 생성되도록 진행

```
dart run build_runner build --delete-conflicting-outputs

or

dart run build_runner watch
```

**6. language json []**
assets/languages/ 디렉토리에 언어팩 json파일을 아래의 규격대로 생성

```
{languageCode}-{countryCode}.json
```

json파일에 정의 되는 규격 (기본) > depth로 넣어도 가능

```
{
   "bottom_nav": {
      "notice": "공지",
      "wallet": "지갑",
      "home": "홈",
      "community": "커뮤니티",
      "settings": "설정"
   },

   ...
}
```

**7. 위젯 적용**
easy_localization library의 언어팩 적용 방법

---

String extension

-  문법 예시 : 'key'.tr()
-  context 필요 : ❌
-  장점 : 가장 간단, 위젯/로직 어디서나 사용 가능
-  단점 : key 관리 어려움
-  사용 추천 상황 : 대부분의 일반 상황

context 기반

-  문법 예시 : context.tr('key')
-  context 필요 : ✅
-  장점 : 안전한 context 기반 처리
-  단점 : 코드가 다소 길다
-  사용 추천 상황 : 위젯 내 번역 로직

정적 함수 호출

-  문법 예시 : tr('key')
-  context 필요 : ❌
-  장점 : context 없이도 명시적 호출 가능
-  단점 : context 없으면 오류 가능성 있음
-  사용 추천 상황 : 전역 상태 등 context 없는 곳

---

args, namedArgs, plural() 까지 적용하는 것을 고려해 동일 규격을 지녓으며,
언어가 변경될 경우 새로운 언어팩을 감지해 동적 앱 적용이 되도록
String extension을 이용해 widget내 적용 진행

```
{
  "greeting": "Hello, {name}!"
}
'greeting'.tr(namedArgs: {'name': 'Namkyung'})

---

'apples'.plural(2);         // ✅ 2개
'apples'.plural('two');     // ❌ 타입 오류 (int만 가능)

---

{
  "profile": {
    "male": "He is a developer",
    "female": "She is a developer",
    "other": "They are developers"
  }
}
'profile'.tr(gender: 'male')
```

**8. 앱 설정**
main.dart
root_screen.dart
language_list_swtich_widget.dart

_(8-1) main.dart_
MaterialApp을 EasyLocalization으로 래핑
_supportedLocales, path, fallbackLocale_ 속성 주입해야 함.
(i) fallbackLocale : 초기 locale 결정 로직에 사용되는 기본값
(ii) path : 번역 값 json 파일 디렉토리 경로
(iii) supportedLocales : 지원 Locale list

-  앱 전역에서 언어(localization) 기능을 작동시키기 위한 '진입점'
-  앱의 최상단에서 설정과 상태전달을 맡음.
-  해당 래핑작업이 되어 있어야, 내부 widget에서 easy_localization의 기능들을 사용 가능
   -  tr() : 번역 적용 // String Extension 기능
   -  context.setLocale() : 번역 언어 변경 // context Extension 기능
   -  LocalizationsDelegate, LocaleResolutionCallback
      -  내부적으로 자동 처리
      -  수동 구현 없이 자동으로 다국어 전환과 fallback 지원

_(8-2) root_screen.dart_
MaterialApp에서 _localizationsDelegates, supportedLocales, locale_ 속성 설정 필요

-  언어 변화 상태를 읽기위해 flutter_riverpod의 Widget ref의 watch 기능을 사용하고,
   변경된 언어가 있을 경우 MaterialApp(앱자체) 재빌드가 되도록 함.
