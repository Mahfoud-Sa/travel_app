import 'package:bloc/bloc.dart';
import 'package:travel_app/cubit/app_state.dart';
import 'package:travel_app/model/data_model.dart';
import 'package:travel_app/services/data_services.dart';

class AppCubits extends Cubit<CubitState> {
  AppCubits({required this.data}) : super(InitialState()) {
    emit(WelcomeState());
  }
  final DataServices data;
  List<DataModel> places = [];
  void getData() async {
    emit(LoadingState());
    places = await data.getInfo();
    emit(LoadedState(places));
    //emit(LoadedState(places));
  }

  void detailPage(DataModel data) {
    emit(DetailState(data));
  }
}
