import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? name;
  String? pass;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Form"),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Name",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                onSaved: (String? val) {
                  name = val!;
                },
                validator: (String? val) {
                  if (val!.isEmpty) {
                    return "Plaese enter name";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  hintText: "Enter your name",
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Password",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                onSaved: (String? val) {
                  pass = val!;
                },
                validator: (String? val) {
                  if (val!.isEmpty) {
                    return "Plaese enter password";
                  } else {
                    return null;
                  }
                },
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Enter your password",
                ),
              ),
              SizedBox(height: 20),
              MaterialButton(
                minWidth: double.infinity,
                color: Colors.red,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    saveToAPI(name: name, pass: pass);
                  } else {
                    print("Err");
                  }
                },
                child: Text(
                  "Save",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future saveToAPI({String? name, String? pass}) async {
    print(name);
    print(pass);
    var body = {"name": name, "password": pass};
    CoolAlert.show(
      context: context,
      type: CoolAlertType.success,
      text: "Your $name was successful!",
    );
  }
}
