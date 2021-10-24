import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_course_autumn_2021/second_page.dart';
import 'package:get/get.dart';

class FirstPage extends StatefulWidget {
  FirstPage({Key key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  Map map = Map();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    emailController.value = TextEditingValue(text: 'closure@gmail.com');
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(map['returnedData'] ?? 'no data'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) {
                    if (value.length > 3)
                      return null;
                    else
                      return 'the value should be more than three digits';
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'email address',
                    hintText: "info@example.com",
                    hintStyle: TextStyle(fontSize: 20),
                    // fillColor: Colors.red,
                    filled: true,
                    focusColor: Colors.green,
                  ),
                  enabled: true,
                  autofocus: true,
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) {
                    if (value.length > 3)
                      return null;
                    else
                      return 'the value should be more than three digits';
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'password',
                    hintText: "P@ssw0rd",
                    hintStyle: TextStyle(fontSize: 20),
                    // fillColor: Colors.red,
                    filled: true,
                    focusColor: Colors.green,
                  ),
                  obscureText: true,
                  enabled: true,
                  autofocus: true,
                  keyboardType: TextInputType.emailAddress,
                  controller: passwordController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    
                    if (formKey.currentState.validate()) {
                      // Navigator.of(context)
                      //     .pushNamed('/second_page', arguments: {
                      //   'email': emailController.text,
                      //   'password': passwordController.text,
                      // }).then((value) {
                      //   setState(() {
                      //     map = value;
                      //   });
                      // });
                      // Get.toNamed('/second_page');
                      print('invalid values');
                    }
                  },
                  child: Text(
                    'submit',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
