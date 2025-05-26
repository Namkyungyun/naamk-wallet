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
