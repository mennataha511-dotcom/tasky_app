import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'new_task.dart';

class FPage extends StatefulWidget  {
  const FPage({super.key});

  @override
  State<FPage> createState() => _FPageState();
}

class _FPageState extends State<FPage> {

  @override
  Widget build(BuildContext context) {




    final date = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          DateFormat.yMMMMEEEEd().format(date),
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
          centerTitle:true ,
      ),
   body: Padding(
     padding: const EdgeInsets.all(16.0),
     child: Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
         Text("welcome to TASKY app" ,
         style:Theme.of(context).textTheme.displayLarge,
         ),

         ],
       ),
       ),



     ),

      floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(context,
              MaterialPageRoute(
                builder: (context) => NewTask(),
              ),
            );
          } ,
        backgroundColor: Color(0xFF15B86C),
        child: Icon(Icons.add ,
          color: Color(0xFFFFFCFC),),
      ),
            );
  }


}
