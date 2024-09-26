import 'package:alarm_apps/views/home_page.dart';
import 'package:alarm_apps/services/cubits/alarm_cubits.dart';
import 'package:alarm_apps/services/cubits/bloc_observes.dart';
import 'package:alarm_apps/services/models/alarm_model.dart';
import 'package:alarm_apps/services/notifications_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalNotificationService.init();
  Bloc.observer = SimpleBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(ModelAlarmAdapter());
  var box = await Hive.openBox<ModelAlarm>('alarm');
  runApp(AlarmApp());
}
class AlarmApp extends StatelessWidget {
  const AlarmApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => AlarmCubits(),
        child: HomePage(),
      ),);
  }
}
