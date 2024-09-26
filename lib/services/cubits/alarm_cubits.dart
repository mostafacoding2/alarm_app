import 'package:alarm_apps/services/models/alarm_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
part'alarm_states.dart';
class AlarmCubits extends Cubit<AlarmStates>{
  static  AlarmCubits  get(context)=> BlocProvider.of(context);
  List<ModelAlarm>?alarms;
  AlarmCubits():super(InitialAlarmState());
  addAlarm( ModelAlarm model)async {
    emit(LoadingAlarmState());
    try{
 var alarmbox=   Hive.box<ModelAlarm>('alarm');
    await  alarmbox.add(model);
 emit(SuccessAlarmState());
  } catch(e)
  {
     emit(FailureAlarmState(e.toString()));
  }
}
  showNote() {
    try{
    var alarmbox = Hive.box<ModelAlarm>('alarm');
    alarms = alarmbox.values.toList();
    emit(SuccessAlarmState());
  }
    catch(e)
    {
    emit(FailureAlarmState(e.toString()));
    }
  }
}