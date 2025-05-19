import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:bloc/bloc.dart';


import '../../../core/bloc/common_event.dart';
import '../../../core/bloc/common_state.dart';

part 'home_bloc.g.dart';
part 'home_event.dart';
part 'home_state.dart';



class HomeBloc extends Bloc<CommonEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<Initial>(_onInitial);
    // on<LoadHomeData>(_onLoadHomeData);
  }

  Future<void> _onInitial(Initial event, Emitter<HomeState> emit) async {
    // add(const LoadHomeData());
  }

  // Future<void> _onLoadHomeData(LoadHomeData event, Emitter<HomeState> emit) async {
  //   emit(state.copyWith(isLoading: true, errorMessage: null));
  //
  //   try {
  //     await Future.delayed(const Duration(seconds: 1)); // 데이터 로딩 시뮬레이션
  //     emit(state.copyWith(isLoading: false));
  //   } catch (e) {
  //     emit(state.copyWith(isLoading: false, errorMessage: '데이터 로딩 실패: $e'));
  //   }
  // }
}
