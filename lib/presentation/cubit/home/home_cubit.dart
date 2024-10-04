import 'package:ageal/domain/entity/home_entity.dart';
import 'package:ageal/domain/repo/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo homeRepo;
  HomeCubit({required this.homeRepo}) : super(HomeInitial());
  Future<void> getHome() async {
    emit(HomeLoading());
    final result = await homeRepo.getHome();
    result.fold(
      (failure) {
        emit(HomeFailure(message: failure.message));
      },
      (homeResult) {
        emit(HomeSuccess(homeEntity: homeResult));
      },
    );
  }
}
