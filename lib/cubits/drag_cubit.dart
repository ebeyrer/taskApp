import 'package:flutter_bloc/flutter_bloc.dart';

class DragCubit extends Cubit<bool> {
  DragCubit() : super(false);

  void startDragging() {
    emit(true);
  }

  void stopDragging() {
    emit(false);
  }
}
