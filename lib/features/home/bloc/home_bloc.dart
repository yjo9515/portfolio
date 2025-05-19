import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:bloc/bloc.dart';
import 'package:portfolio/core/domain/model/project_model.dart';


import '../../../core/bloc/common_event.dart';
import '../../../core/bloc/common_state.dart';
import '../../../core/type/enum.dart';

part 'home_bloc.g.dart';
part 'home_event.dart';
part 'home_state.dart';



class HomeBloc extends Bloc<CommonEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<Initial>(_onInitial);
  }

  Future<void> _onInitial(Initial event, Emitter<HomeState> emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    try {
      await Future.delayed(const Duration(seconds: 1));

      final projects = [
        Project(
          title: 'TPASS 방문자 관리 웹/앱 보안 솔루션',
          description:
          '- 삼성 knox 및 IOS mobileconfig를 이용하여 디바이스의 카메라를 차단하고 해제시키는 어플\n'
              '- QR코드 차단, 비콘해제, 수동해제 기능 추가, 스크린샷 방지 기능 추가\n'
              '- 관리자 페이지에서 기능 on/off기능 추가 및 데이터 미반영 에러 수정\n'
              '- DEEPLink를 이용하여 웹에서 앱을 바로열어서 차단할 수 있는 기능 추가'
              ,
          links: {
            'playstore' : 'https://play.google.com/store/apps/details?id=com.laonstory.mguard&hl=ko',
            'appstore' : 'https://apps.apple.com/kr/app/tpass-%ED%8B%B0%ED%8C%A8%EC%8A%A4-%EB%B0%A9%EB%AC%B8%EC%9E%90-%EB%AA%A8%EB%B0%94%EC%9D%BC-%EA%B4%80%EB%A6%AC-%EC%86%94%EB%A3%A8%EC%85%98/id6451189407'
          },
          techStack: ['#flutter', '#bloc', '#java' ,'#BLE' , '#NFC'],
           imagePaths: ['assets/images/tpass/tpass1.png','assets/images/tpass/tpass2.jpg','assets/images/tpass/tpass3.jpg','assets/images/tpass/tpass4.jpg','assets/images/tpass/tpass5.jpg'],
        ),
        Project(
          title: '한국서부발전 계좌등록시스템/제안서평가 시스템',
          description:
          '- 블록체인기반으로 거래약정서를 발급 및 관리하는 시스템\n'
              '- 로그 페이지 UI/UX 개발 및 무한 로딩 방지 처리\n'
              '- 인증 API 연동 및 401 인증 만료 시 처리 로직 구현\n'
              '- 검색 기능 및 상세페이지 기능 구현 (응답 API, 유저 role 매핑)\n'
              '- 주민등록번호 및 사업자등록번호 유효성 검사 및 마스킹 처리\n'
              '- 세션 타임아웃 처리 및 logout 관련 세션/마스킹 연동 구현'
          ,
          links: {
            '계좌등록시스템 홈페이지' : 'https://ewha.iwest.co.kr/',
            '제안서평가시스템 홈페이지' : 'https://block.iwest.co.kr/'
          },
          techStack: ['#react', '#java' ,'#spring'],
          imagePaths: ['assets/images/iwest/iwest1.png','assets/images/iwest/iwest2.png'],
        ),
        Project(
          title: '평택시민의료생협 조합원 관리 앱/웹',
          description:
              '- 빈값으로 출자금,포인트,행사 등록시 null에러수정'
              '- 구좌,출자금 및 포인트가 0보다 작을때 에러수정\n'
              '- 행사글 수정 후 리스트화면에서 새로고침이 안됨\n'
              '- 공지사항 제목에 커서와 내용 커서가 겹치는 에러\n'
              '- 메인대시보드에서 출자금,행사,공지 수정 시 null값 체크 안하는 에러 수정\n'
              '- 스토어 버전정보 체크 로직 추가'
          ,
          links: {
            '플레이스토어' : 'https://play.google.com/store/search?q=%ED%8F%89%ED%83%9D%EC%8B%9C%EB%AF%BC%EC%9D%98%EB%A3%8C%EC%83%9D%ED%98%91&c=apps&hl=ko',
            '앱스토어' : 'https://apps.apple.com/kr/app/%ED%8F%89%ED%83%9D%EC%8B%9C%EB%AF%BC%EC%9D%98%EB%A3%8C%EC%83%9D%ED%98%91-%EB%9D%BC%EC%98%A8%EC%8A%A4%ED%8E%98%EC%9D%B4%EC%8A%A4/id6450877425'
          },
          techStack: ['#flutter', '#bloc'],
          imagePaths: ['assets/images/union/union1.jpg','assets/images/union/union2.jpg'],
        ),
        Project(
          title: '서울시립대 주소록 앱',
          description:
          '- 닉네임 및 영문 검색 기능,업데이트 체크 기능 추가'
              '- 마이페이지 화면 구성 및 API 연동\n'
              '- 비밀번호 변경, 이용약관 레이아웃 수정\n'
              '- 필터 기능 개선 및 필터 영문 변환 처리\n'
              '- 스타일, 에러 다이얼로그, 라우팅 처리\n'
          ,
          links: {
            '플레이스토어' : 'https://play.google.com/store/apps/details?id=com.laonstory.addressbook&hl=ko',
            '앱스토어' : 'https://apps.apple.com/kr/app/isus-members/id1559178750'
          },
          techStack: ['#flutter', '#getX'],
          imagePaths: ['assets/images/isus/isus01.jpg'],
        ),
        Project(
          title: '스마트도어 hizib 앱',
          description:
          '- 스마트도어전용 iot기반 어플이며 어플로 문을 열고 닫거나 키오스크를 통해 영상통화를 할 수 있습니다.'
              '- ble통신 기능 (블루투스 연결상태 확인 > 기기 고유 uuid값과 설정된 값 비교 > appkey값 생성 >  aes128방식으로 인코딩 후 기기전송 > 기기에서 리턴받은 값을 다시 디코딩 > 결과값에따라 화면처리)\n'
              '- mqtt통신 기능 (mqtt 커넥 > 토픽값설정 > 토픽값에따른 구독 > restapi를 이용해 서버로 mqtt 요청 > 구독한 채널로 리턴값 전송 받음 > 화면처리)\n'
              '- 영상통화 기능 (agora 엔진 이용 채널명과 appid 값 설정 후 통화연결)\n'
          ,
          links: {
            '참고사이트' : 'https://wisemonster.kr/home/#section-page4',
          },
          techStack: ['#flutter', '#getX', '#mqtt', '#ble'],
          imagePaths: ['assets/images/wikibox/wikibox.png'],
        ),

      ];
      emit(state.copyWith(isLoading: false,projects: projects));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: '데이터 로딩 실패: $e'));
    }
  }
}
