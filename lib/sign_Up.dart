import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 100),
          child: Column(
            children: [
              Text(
                'Sign Up ',
                style: TextStyle(fontSize: 30),
              ),
              Container(
                margin: EdgeInsets.only(left: 5, top: 30),
                height: 50,
                width: 250,
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)),
                      hintText: "Enter UserName...."),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 5, top: 20),
                height: 50,
                width: 250,
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      hintText: "Enter LastName...."),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 5, top: 20),
                height: 50,
                width: 250,
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      hintText: "Phone...."),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 5, top: 20),
                height: 50,
                width: 250,
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      hintText: "Password...."),
                ),
              ),
              SizedBox(height: 5),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "LoginPage");
                },
                child: Text('SignUp'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
