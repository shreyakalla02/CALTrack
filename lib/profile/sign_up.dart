import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/profile/users_specific.dart';
import 'package:provider/provider.dart';
import 'package:form_validator/form_validator.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isHidden = true;

  final _formKey = GlobalKey<FormState>();

  String firstNameInput = "";
  String lastNameInput = "";
  String userNameInput = "";
  String passwordInput = "";
  String confirmPasswordInput = "";
  String ageInput = "";
  String genderInput = "";
  String heightInput = "";
  String weightInput = "";

  var firstNameValidator =
      ValidationBuilder(requiredMessage: "First Name is required!").build();
  var lastNameValidator =
      ValidationBuilder(requiredMessage: "Last Name is required!").build();
  var userNameValidator =
      ValidationBuilder(requiredMessage: "UserName is required!").build();
  var passwordValidator =
      ValidationBuilder(requiredMessage: "Password is required!").build();
  var ageValidator =
      ValidationBuilder(requiredMessage: "Age is required!").build();
  var heightValidator =
      ValidationBuilder(requiredMessage: "Height is required!").email().build();
  var weightValidator =
      ValidationBuilder(requiredMessage: "Weight is required!").build();
  var genderValidator =
      ValidationBuilder(requiredMessage: "Gender is required!").build();
  var confirmPasswordValidator =
      ValidationBuilder(requiredMessage: "Confirm Password is required!")
          .build();

  List? isError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Center(
                child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 5),
            Text(
              "Sign Up",
              style: GoogleFonts.poiretOne(
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
            const SizedBox(height: 5),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, top: 4.0, bottom: 4.0),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "First Name",
                            ),
                            validator: firstNameValidator,
                            onSaved: ((value) =>
                                setState(() => firstNameInput = value!)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, top: 4.0, bottom: 4.0),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Last Name",
                            ),
                            validator: lastNameValidator,
                            onSaved: ((value) =>
                                setState(() => lastNameInput = value!)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, top: 4.0, bottom: 4.0),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "UserName",
                            ),
                            validator: userNameValidator,
                            onSaved: ((value) =>
                                setState(() => userNameInput = value!)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, top: 4.0, bottom: 4.0),
                          child: TextFormField(
                            obscureText: isHidden,
                            validator: passwordValidator,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Password",
                                suffixIcon: InkWell(
                                  onTap: _togglePasswordView,
                                  child: Icon(
                                    isHidden
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.grey,
                                  ),
                                )),
                            onSaved: ((value) =>
                                setState(() => passwordInput = value!)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, top: 4.0, bottom: 4.0),
                          child: TextFormField(
                            obscureText: true,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Re-Enter Password",
                            ),
                            validator: confirmPasswordValidator,
                            onSaved: ((value) =>
                                setState(() => confirmPasswordInput = value!)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, top: 4.0, bottom: 4.0),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Age",
                            ),
                            validator: ageValidator,
                            onSaved: ((value) =>
                                setState(() => ageInput = value!)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, top: 4.0, bottom: 4.0),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Gender",
                            ),
                            validator: genderValidator,
                            onSaved: ((value) =>
                                setState(() => genderInput = value!)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        children: [
                          Container(
                            width: 150,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0, top: 4.0, bottom: 4.0),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Height",
                                ),
                                validator: heightValidator,
                                onSaved: (value) =>
                                    setState(() => heightInput = value!),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          const Text(
                            "inches",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        children: [
                          Container(
                            width: 150,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0, top: 4.0, bottom: 4.0),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Weight",
                                ),
                                validator: weightValidator,
                                onSaved: (value) =>
                                    setState(() => weightInput = value!),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          const Text(
                            "lbs",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),

                    InkWell(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState?.save();

                          var createAccount =
                              context.read<UserSpecific>().signUp(
                                    firstNameInput,
                                    lastNameInput,
                                    userNameInput,
                                    passwordInput,
                                    confirmPasswordInput,
                                    ageInput,
                                    heightInput,
                                    weightInput,
                                    genderInput,
                                  );

                          if (createAccount[0] == false) {
                            setState((() => isError = createAccount));
                          } else {
                            setState((() => isError = null));
                            GoRouter.of(context).go("/login");
                          }
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 180, 140, 255),
                              borderRadius: BorderRadius.circular(12)),
                          child: const Center(
                            child: Text(
                              "Register",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    isError != null
                        ? Text(
                            isError![1],
                            style: const TextStyle(color: Colors.red),
                          )
                        : const SizedBox()
                  ],
                )),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already a member?",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () => GoRouter.of(context).go("/login"),
                  child: const Text(
                    " Sign in!",
                    style: TextStyle(
                      color: Color.fromARGB(255, 180, 140, 255),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ],
        ))));
  }

  void _togglePasswordView() {
    setState(() {
      isHidden = !isHidden;
    });
  }
}
