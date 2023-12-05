import 'package:equatable/equatable.dart';
import 'package:travel_app/model/data_model.dart';

abstract class CubitState extends Equatable {}

class InitialState extends CubitState {
  InitialState();

  @override
  List<Object> get props => [];
}

final class WelcomeState extends CubitState {
  @override
  List<Object?> get props => [];
}

final class LoadingState extends CubitState {
  @override
  List<Object?> get props => [];
}

final class LoadedState extends CubitState {
  LoadedState(this.places);
  final List<DataModel> places;
  @override
  List<Object?> get props => [places];
}

final class DetailState extends CubitState {
  DetailState(this.place);
  final DataModel place;
  @override
  List<Object?> get props => [place];
}
