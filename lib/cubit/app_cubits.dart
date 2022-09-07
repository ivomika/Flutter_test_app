import 'package:bloc/bloc.dart';
import 'package:test_app/cubit/app_cubit_states.dart';
import 'package:test_app/model/data_model.dart';
import 'package:test_app/pages/navPages/home_page.dart';
import 'package:test_app/services/data_services.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits({required this.data}) : super(InitialState()) {
    emit(WelcomeState());
  }
  final DataService data;
  late final places;

  void getData() async{
    try{
      emit(LoadingState());
      places = await data.getInfo();
      emit(LoadedState(places));
    }
    catch(e){

    }
  }

  detailPage(DataModel data){
    emit(DetailState(data));
  }

  goHome(){
    emit(LoadedState(places));
  }
}
