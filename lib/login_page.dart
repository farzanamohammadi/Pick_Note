import 'package:flutter/material.dart';
import 'package:pick_note1/sign_Up.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: Center(
        child: Container(

          margin: EdgeInsets.only(top: 100),
          child: Column(
            children: [

              Text(
                'Login',
                style: TextStyle(fontSize: 30),
              ),


              Container(
                margin: EdgeInsets.only(left: 5, top: 20),
                height: 50,
                width: 250,
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)),
                      hintText: "User Name....."),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 5, top: 20),
                height: 50,
                width: 250,
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)),
                      hintText: "Password...."),
                ),
              ),
              SizedBox(height: 12,),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "Re");
                },
                child: Text('Login'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
