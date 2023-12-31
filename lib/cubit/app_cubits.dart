import 'package:bloc/bloc.dart';
import 'package:travel_app/cubit/app_states.dart';
import 'package:travel_app/models/data_model.dart';
import 'package:travel_app/services/data_services.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits({required this.data}) : super(InitState()) {
    emit(WelcomeState());
  }
  final DataServices data;
  late final List<DataModel> places;

  void getData() async {
    try {
      emit(LoadingState());
      places = await data.getInfo();
      emit(LoadedState(places));
    } catch (e) {
      print(e.toString());
    }
  }

  detailPage(DataModel data) {
    print(data);
    emit(DetailState(data));
  }

  goHome() {
    emit(LoadedState(places));
  }
}
