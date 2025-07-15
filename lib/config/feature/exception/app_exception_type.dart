enum AppExceptionType {
  // 네트워크/서버 관련
  noInternet(
    statusCode: 'NO_INTERNET',
    message: '인터넷 연결을 확인해주세요.',
  ),
  timeout(
    statusCode: 'TIMEOUT',
    message: '서버 응답이 지연되고 있습니다. 잠시 후 다시 시도해주세요.',
  ),
  maintenanceMode(
    statusCode: 'MAINTENANCE',
    message: '현재 점검 중입니다. 잠시 후 다시 접속해주세요.',
  ),

  // 인증/권한 관련
  unAuthorized(
    statusCode: 'UNAUTHORIZED',
    message: '로그인이 필요합니다.',
  ),
  forbidden(
    statusCode: 'FORBIDDEN',
    message: '해당 기능에 대한 접근 권한이 없습니다.',
  ),
  sessionExpired(
    statusCode: 'SESSION_EXPIRED',
    message: '세션이 만료되었습니다. 다시 로그인해주세요.',
  ),

  // 클라이언트 내부
  unknownError(
    statusCode: 'UNKNOWN_ERROR',
    message: '알 수 없는 오류가 발생했습니다.',
  ),
  parsingError(
    statusCode: 'PARSING_ERROR',
    message: '데이터 처리 중 오류가 발생했습니다.',
  ),

  // 비즈니스 로직 예외
  forceUpdateRequired(
    statusCode: 'FORCE_UPDATE_REQUIRED',
    message: '최신 버전으로 업데이트가 필요합니다.',
  ),

  // http 상태 코드 기반
  badRequest(
    statusCode: 'BAD_REQUEST',
    message: '요청이 잘못되었습니다.',
  ),
  notFound(
    statusCode: 'NOT_FOUND',
    message: '요청하신 리소스를 찾을 수 없습니다.',
  ),
  methodNotAllowed(
    statusCode: 'METHOD_NOT_ALLOWED',
    message: '허용되지 않은 메서드입니다.',
  ),
  unsupportedMediaType(
    statusCode: 'UNSUPPORTED_MEDIA_TYPE',
    message: '지원하지 않는 콘텐츠 타입입니다.',
  ),
  validationFailed(
    statusCode: 'VALIDATION_FAILED',
    message: '입력값이 유효하지 않습니다.',
  ),
  tooManyRequests(
    statusCode: 'TOO_MANY_REQUESTS',
    message: '요청이 너무 많습니다. 잠시 후 다시 시도해주세요.',
  ),

  internalServerError(
    statusCode: 'INTERNAL_SERVER_ERROR',
    message: '서버 내부 오류가 발생했습니다.',
  );

  final String statusCode; // 내부로깅, 분기처리 시 활용
  final String message; // 사용자 안내 목적
  const AppExceptionType({required this.statusCode, required this.message});
}
