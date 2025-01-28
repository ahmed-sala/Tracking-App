
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/src/presentation/managers/edit_my_info/edit_my_info_actions.dart';
import 'package:tracking_app/src/presentation/managers/edit_my_info/edite_my_info_states.dart';


@injectable
class EditeMyInfoViewModel extends Cubit<EditeMyInfoStates>{
  EditeMyInfoViewModel() : super(InitialState());




  void doAction(EditeMyInfoActions action){
    switch (action) {

    }
  }
}