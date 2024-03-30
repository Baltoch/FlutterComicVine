import 'package:flutter_bloc/flutter_bloc.dart';

class CurrentPageIndexCubit extends Cubit<int> {
  CurrentPageIndexCubit() : super(0);

  void set(int index) => emit(index);
}