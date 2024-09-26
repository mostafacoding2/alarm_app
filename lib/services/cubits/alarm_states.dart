part of'alarm_cubits.dart';
@immutable
abstract class AlarmStates{}
class InitialAlarmState extends AlarmStates{}
class LoadingAlarmState extends AlarmStates{}
class SuccessAlarmState extends AlarmStates{}
class FailureAlarmState extends AlarmStates{
  String errorMessage;
  FailureAlarmState(this.errorMessage);

}
