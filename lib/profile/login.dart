import "package:flutter/material.dart";
import 'package:form_validator/form_validator.dart';
import 'package:go_router/go_router.dart';
import 'package:project/profile/users_specific.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isHidden = true;

  final _formKey = GlobalKey<FormState>();

  String userNameInput = "";
  String passwordInput = "";

  var userNameValidator =
      ValidationBuilder(requiredMessage: "UserName is required!").build();
  var passwordValidator =
      ValidationBuilder(requiredMessage: "Password is required!").build();

  bool isError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //app logo
                Image.asset(
                  'images/caltrack_image.png',
                  height: 200,
                  width: 200,
                ),


                const SizedBox(height: 5),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    "Where Every Bite Counts, Every Move Matters!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 15),


                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: TextFormField(
                        validator: userNameValidator,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "UserName",
                          prefixIcon: Icon(
                            Icons.account_circle,
                            color: Color.fromARGB(255, 180, 140, 255),
                          ),
                        ),
                        onSaved: (value) => setState(() {
                          userNameInput = value!;
                        }),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),


                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: TextFormField(
                        obscureText: isHidden,
                        validator: passwordValidator,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Password",
                            prefixIcon: const Icon(
                              Icons.privacy_tip_rounded,
                              color: Color.fromARGB(255, 180, 140, 255),
                            ),
                            suffixIcon: InkWell(
                              onTap: _togglePasswordView,
                              child: Icon(
                                isHidden
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.grey,
                              ),
                            )),
                        onSaved: (value) => setState(() {
                          passwordInput = value!;
                        }),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),

                //new sign in button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: () {
                      // Validate returns true if the form is valid, or false otherwise.
                      if (_formKey.currentState!.validate()) {
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                        _formKey.currentState?.save();

                        debugPrint(_formKey.currentState.toString());

                        var loginResult = context.read<UserSpecific>().login(
                              userNameInput,
                              passwordInput,
                            );

                        if (loginResult == false) {
                          setState((() => isError = true));
                        } else {
                          setState((() => isError = false));

                          GoRouter.of(context).go("/");
                        }

                        debugPrint(loginResult.toString());
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 180, 140, 255),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text(
                          "Log In",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                isError == true
                    ? const Text(
                        "There is no account found, please try again",
                        style: TextStyle(color: Colors.red),
                      )
                    : const SizedBox(),
                const SizedBox(height: 12),

                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "eady to join?",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      // onTap: widget.showRegisterpage,
                      onTap: () => GoRouter.of(context).go("/sign_up"),
                      child: const Text(
                        " Sign up now!",
                        style: TextStyle(
                          color: Color.fromARGB(255, 180, 140, 255),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      isHidden = !isHidden;
    });
  }
}
