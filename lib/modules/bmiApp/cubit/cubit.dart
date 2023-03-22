
import 'package:flutter_bloc/flutter_bloc.dart';

import '../states/states.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterinitialState());
  static CounterCubit get(context) => BlocProvider.of(context);
  bool isMale = true;
  double hight = 120;
  double weight = 40;
  double age = 20;
  void mainsage() {
    age--;
    emit(Countermainsage(age));
  }

  void mainshight() {
    hight--;
    emit(Countermainshight());
  }

  void mainsweight() {
    weight--;
    emit(Countermainsweidth());
  }

  void plusage() {
    age++;
    emit(Counterplusage(age));
  }

  void plushight() {
    hight++;
    emit(Counterplushight());
  }

  void plusweight() {
    weight++;
    emit(Counterpluswidth());
  }

  void male() {
    isMale = false;
    emit(Counterismale());
  }

  void Female() {
    isMale = false;
    emit(Counterisfemale());
  }
}
