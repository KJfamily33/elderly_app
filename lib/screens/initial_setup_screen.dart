import 'package:elderly_app/widgets/app_default.dart';
import 'package:flutter/material.dart';
import 'package:sweet_alert_dialogs/sweet_alert_dialogs.dart';
import 'profile_screen.dart';
import 'home_screen.dart';

class InitialSetupScreen extends StatefulWidget {
  static const String id = 'Initial_Screen';
  @override
  _InitialSetupScreenState createState() => _InitialSetupScreenState();
}

class _InitialSetupScreenState extends State<InitialSetupScreen> {
  bool isCompleted = false;
  final userNameController = new TextEditingController();
  String userName;
  int age;
  @override
  void dispose() {
    userNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Elderly '),
            Text(
              'Care',
              style: TextStyle(color: Colors.green),
            ),
            Padding(
              padding: EdgeInsets.only(right: 35),
            )
          ],
        ),
        elevation: 1,
      ),
      body: WillPopScope(
        onWillPop: () async {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return RichAlertDialog(
                  alertTitle: richTitle("Complete the Setup."),
                  alertSubtitle:
                      richSubtitle('Please provide details to continue'),
                  alertType: RichAlertType.WARNING,
                  actions: <Widget>[
                    FlatButton(
                      child: Text("OK"),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                );
              });
          return await Future.value(false);
        },
        child: ListView(
          children: <Widget>[
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 20, bottom: 10),
                child: Text(
                  'Complete the Initial setup',
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'The app requires you to give some data during this setup. Kindly enter all required data to all the fields below for best performance.',
                style: TextStyle(
                    fontWeight: FontWeight.w200, color: Colors.indigo),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
              child: Row(
                children: <Widget>[
                  Expanded(child: Text('Name : ')),
                  Expanded(
                    flex: 6,
                    child: FormItem(
                      helperText: 'Name of the user',
                      hintText: 'Enter type of User Name',
                      controller: userNameController,
                      onChanged: () {
                        print('Name Saved');
                        setState(() {
                          userName = userNameController.text;
                        });
                      },
                      isNumber: false,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextInputField extends StatelessWidget {
  var editingController = TextEditingController();
  final String helperText;
  final String hintText;
  Function valueGetter;
  IconData icon;

  TextInputField(
      {this.editingController,
      this.valueGetter,
      this.helperText,
      this.hintText,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: TextField(
        controller: editingController,
        style: TextStyle(),
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                  color: Color(0xffaf5676), style: BorderStyle.solid)),
          helperText: helperText,
          icon: Icon(icon, color: Colors.blueAccent),
          hintText: hintText,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide:
                  BorderSide(color: Colors.indigo, style: BorderStyle.solid)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                  color: Color(0xffaf5676), style: BorderStyle.solid)),
        ),
        onChanged: valueGetter,
      ),
    );
  }
}
