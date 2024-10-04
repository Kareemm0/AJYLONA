import 'package:ageal/presentation/cubit/platfrom/new_generation_state.dart';
import 'package:bloc/bloc.dart';

class NewGenerationCubit extends Cubit<NewGenerationState> {
  NewGenerationCubit() : super(NewGenerationInitialState());

  int selectedIndex = 0;

  void onTabTapped(int index) {
    selectedIndex = index;
    emit(ChangeTabIndexState());
  }
}
