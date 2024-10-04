import 'package:ageal/domain/repo/news/news_repo.dart';
import 'package:ageal/presentation/cubit/news/news_state.dart';
import 'package:bloc/bloc.dart';

class NewsCubit extends Cubit<NewsState> {
  final NewsRepo newsRepo;
  NewsCubit(this.newsRepo) : super(NewInitialState());

  Future<void> getNews() async {
    emit(NewLoadingState());
    final response = await newsRepo.getNews();

    response.fold((failure) {
      emit(NewFailureState(errorMessage: failure.message));
    }, (news) {
      emit(NewSuccessState(newsEntities: news));
    });
  }
}
