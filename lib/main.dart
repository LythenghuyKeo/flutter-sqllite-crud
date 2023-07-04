import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter SQLite demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});




  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _name_controller = TextEditingController();
  TextEditingController _idcontroller = TextEditingController();
  TextEditingController _yearcontroller = TextEditingController();
  TextEditingController _agecontroller = TextEditingController();
  TextEditingController _phoneNumcontroller = TextEditingController();
  Widget textfield(controller,labeltext,hinttext){
    return Container(
      padding: EdgeInsets.all(40),
        child:TextField(
      
        controller: controller,
        decoration: InputDecoration(
        labelText: labeltext,
        hintText: hinttext,
        border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10)
    )
        )
    )
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title:Text('KIT SQLLIte Demo')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          textfield(_idcontroller,'Student ID','Enter student id ex:ABC10010001:'),
          textfield(_name_controller, 'Name', 'Enter Student name:'),
          textfield(_yearcontroller, 'Year of study','Enter year of study: '),
          textfield(_agecontroller, 'Age', 'Enter the student age :'),
          textfield(_phoneNumcontroller, 'Phone Number', 'Enter student phone number:'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            ElevatedButton(onPressed: (){}, child:Text('Save')),
            ElevatedButton(onPressed: (){}, child:Text('Clear')),
            ElevatedButton(onPressed: (){}, child:Text('View'))
          ],)
        ],
      )

    );
  }
}
