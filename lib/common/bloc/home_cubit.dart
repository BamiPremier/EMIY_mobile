import 'package:potatoes/common/bloc/value_cubit.dart';

class HomeCubit extends InitialValueCubit<int> {
  HomeCubit() : super(0);

  moveTo(int page) => emit(page);
}