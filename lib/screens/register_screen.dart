import 'package:flutter/material.dart';
import 'package:productos_app/providers/login_form_provider.dart';
import 'package:productos_app/services/services.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ChangeNotifierProvider(
      create: (_) => LoginFormProvider(),
      child: _RegisterForm(),
    ));
  }
}

class _RegisterForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          reverse: true,
          child: Form(
            key: loginForm.formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Container(
              child: Column(
                children: [
                  Container(
                    child: Image.network(
                      'https://images.unsplash.com/photo-1486325212027-8081e485255e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1470&q=80',
                      width: double.infinity,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        TextFormField(
                          onChanged: (value) => loginForm.name = value,
                          validator: (value) {
                            return (value != null && value.length >= 4)
                                ? null
                                : '4 characters at least';
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              filled: true,
                              hintText: 'Full Name',
                              hintStyle: TextStyle(color: Colors.black),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2),
                              )),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          onChanged: (value) => loginForm.email = value,
                          validator: (value) {
                            String pattern =
                                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                            RegExp regExp = new RegExp(pattern);

                            return regExp.hasMatch(value ?? '')
                                ? null
                                : 'not valid email';
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              filled: true,
                              hintText: 'Email Adress',
                              hintStyle: TextStyle(color: Colors.black),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2),
                              )),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          onChanged: (value) => loginForm.password = value,
                          validator: (value) {
                            return (value != null && value.length >= 6)
                                ? null
                                : '6 characters at least';
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              filled: true,
                              hintText: 'Password',
                              hintStyle: TextStyle(color: Colors.black),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2),
                              )),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            FocusScope.of(context).unfocus();
                            final authService = Provider.of<AuthService>(
                                context,
                                listen: false);

                            if (!loginForm.isValidForm()) return;

                            loginForm.isLoading = true;

                            final String? errorMessage =
                                await authService.createUser(
                                    loginForm.email, loginForm.password, loginForm.name);

                            if (errorMessage == null) {
                              Navigator.pushReplacementNamed(context, 'home');
                            } else {
                              print(errorMessage);
                              loginForm.isLoading = false;
                            }
                            // Navigator.pushReplacementNamed(context, 'home');
                          },
                          child: Text(
                            'Register',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.orange,
                              minimumSize: Size(double.infinity, 50)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          child: Text(
                            "Already have an account?",
                            style: TextStyle(
                                color: Colors.orange,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          onTap: () {
                            Navigator.pushReplacementNamed(context, 'login');
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
