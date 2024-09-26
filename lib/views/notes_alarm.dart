import 'package:alarm_apps/services/cubits/alarm_cubits.dart';
import 'package:alarm_apps/services/models/alarm_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class NotesAlarm extends StatelessWidget 
{
  const NotesAlarm({super.key});
  @override
  Widget build(BuildContext context) 
    {
    return BlocProvider(
  create: (context) => AlarmCubits(),
  child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            Expanded(child: BlocBuilder<AlarmCubits, AlarmStates>(
              builder: (context, state) {
             List<ModelAlarm>Alarms=   AlarmCubits.get(context).showNote();
                return ListView.builder(

                    itemCount: Alarms.length,
                    itemBuilder: (context, index) {
                      return ItemAlarm
                        (
                        modelAlarm:  Alarms[index]                   );
                    }
                );
              },
            ))


          ],),
      ),
    ),
);
  }
}

 class ItemAlarm extends StatefulWidget {
  const   ItemAlarm({super.key,required this.modelAlarm});
  final  ModelAlarm modelAlarm;

   @override
   State<ItemAlarm> createState() => _ItemAlarmState();
 }

 class _ItemAlarmState extends State<ItemAlarm> {
   @override
   Widget build(BuildContext context) {
     return  Container
       (
       padding: EdgeInsets.all(10),
       margin: EdgeInsets.all(20),
       decoration: BoxDecoration(
           color: Colors.white,
           borderRadius: BorderRadius.circular(16),
           boxShadow: [BoxShadow(
               color: const Color(0xffA6A6A6),
               offset: Offset(5, 6),
               blurRadius: 8,
               spreadRadius: 0


           )
           ]
       ),

       width: 150,
       child: Column(crossAxisAlignment: CrossAxisAlignment.start,
         children:
         [
           Text('title:${widget.modelAlarm.content}', style: TextStyle(color: Colors.black, fontSize: 18),),
           Text('content:${widget.modelAlarm.content}', style: TextStyle(color: Colors.black, fontSize: 18),),
           Text('time:${widget.modelAlarm.time}', style: TextStyle(color: Colors.black, fontSize: 18),),
           Text('Date:${widget.modelAlarm.history}', style: TextStyle(color: Colors.black, fontSize: 18),),
           Padding(
             padding: const EdgeInsets.only(left: 290.0),
             child: IconButton(onPressed: () {
             widget.  modelAlarm.delete();

             BlocProvider.of<AlarmCubits>(context).showNote();
             setState(() {
             });
             },
                 icon: Icon(Icons.delete, size: 30, color: Colors.red,)),
           )

         ],),


     );
   }
 }



