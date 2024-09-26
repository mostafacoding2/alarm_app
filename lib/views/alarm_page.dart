import 'package:alarm_apps/services/cubits/alarm_cubits.dart';
import 'package:alarm_apps/services/models/alarm_model.dart';
import 'package:alarm_apps/services/notifications_app.dart';
import 'package:alarm_apps/views/notes_alarm.dart';
import 'package:alarm_apps/widgets/custom_textfromfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class AlarmPage extends StatefulWidget {
  const AlarmPage({super.key});
  @override
  State<AlarmPage> createState() => _AlarmPageState();
}
class _AlarmPageState extends State<AlarmPage> {
  GlobalKey<FormState> keyForm = GlobalKey();
  AutovalidateMode autovalidateMode=AutovalidateMode.disabled;
 String?  Mintue,Day ,Month,Year,Period,Title,Content,Hour;
  int?  mintue,day ,month,year,hour;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Form(key: keyForm,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50,),
              CustomTextFromField(
                  onchange: (data) {Title=data!;},
                  onSaved:(data) {Title=data!;} ,
                  text: 'العنوان ',
                  typeinput: TextInputType.text
              ),
              CustomTextFromField(
                onchange: (data) {
                  Content=data!;
                },
                  onSaved:(data) {
                    Content=data!;
                  },
                text: 'المحتوي ',
                typeinput: TextInputType.text
            ),
              Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomTextFromField
                        (
                        onchange: (data) {
                          Hour=data   ;

                        },
                        onSaved: (data) {
                          Hour=data   ;

                        },
                        text: 'الساعة ',
                        typeinput: TextInputType.number,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomTextFromField
                        (
                        onchange: (data) {
                          Mintue=data ;
                        },
                        onSaved: (data) {
                          Mintue=data ;
                        },
                        text: 'الدقيقة ',
                        typeinput: TextInputType.number,
                      ),
                    ),
                  ),

                  SizedBox(
                    width: 100,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomTextFromField
                        (
                        onchange: (data) {
          if(Period=='am'||Period=='Am') {
            if (Hour == '12') {
              Hour = '0';
            }
            else {
              Hour;
            } }
                 else {
             hour=int.parse( Hour!) +12;
                 }
                          Period=data!;
                          },
                        onSaved:(data) {                        Period=data!;

                        } ,
                        text: 'التوقيت  ',
                        typeinput: TextInputType.text,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50,),
              Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomTextFromField
                        (
                        onchange: (data) {
                          Month=data   ;
                        },
                        onSaved:(data)
                        {
                          Month=data   ;
                        },
                        text: 'الشهر  ',
                        typeinput: TextInputType.number,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomTextFromField
                        (
                        onchange: (data) {
                          Day=data ;
                        },
                        onSaved: (data) {
                          Day=data ;
                        },
                        text: 'اليوم ',
                        typeinput: TextInputType.number,
                      ),
                    ),
                  ),

                  SizedBox(
                    width: 100,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomTextFromField
                        (
                        onchange: (data) {
                          Year=data ;
                          },
                        onSaved: (data) {
                          Year=data ;
                        },
                        text: 'السنه  ',
                        typeinput: TextInputType.number,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50,),
              const SizedBox(height: 50,),
              BlocBuilder<AlarmCubits,AlarmStates >(
                builder: (context, state) {
                  return ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.yellowAccent),
                      onPressed: ()
                      {
                      if(keyForm.currentState!.validate()) {
                        keyForm.currentState?.save();
                        year = int.parse(Year!);
                        month = int.parse(Month!);
                        day = int.parse(Day!);
                        mintue = int.parse(Mintue!);
                        if(Period=='am'||Period=='Am')
                        {
                           hour= int.parse(Hour!);
                        }
                        else if( Period=='am'||Period=='Am'&&Hour=='12'){
                          hour=0;
                        }
                        else {
                          hour=int.parse( Hour!) +12;
                        }
                        print(' hour= ${hour}');
                        LocalNotificationService.showSchduledNotification(
                            title: Title ?? 'good',
                            content: Content ?? "titlred",
                            year: year,
                            month: month,
                            day: day,
                            hour: hour,
                            mintue: mintue
                        );
                        // ModelAlarm modelAlarm = ModelAlarm(content: Content!,
                        //     period: Title!,
                        //     time: '${Hour} +${Mintue} +${Period}',
                        //     history: '${Month} +${Day} +${Year}');
                        // AlarmCubits.get(context).addAlarm(modelAlarm);
                        // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){return NotesAlarm();}));
                            }
                      else
                      {
                        autovalidateMode=AutovalidateMode.always;
                        setState(() {
                        });
                      }
                      }, child: const Text('start')
                  );
                },
              ), const SizedBox(height: 50,),
          ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.red),
          onPressed: () {
          LocalNotificationService.cancelNotification(2);
          }, child: const Text('cancel')
          )
            ],
          ),
        ),
      ),
    );
  }
}