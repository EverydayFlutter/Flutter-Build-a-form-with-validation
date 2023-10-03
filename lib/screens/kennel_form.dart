import 'package:flutter/material.dart';
import 'package:simple_form_validation/theme/colors.dart';

class KennelForm extends StatefulWidget {
  const KennelForm({super.key});

  @override
  State<KennelForm> createState() => _KennelFormState();
}

class _KennelFormState extends State<KennelForm> {
  final _formKennelKey = GlobalKey<FormState>();
  bool rememberPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.darkPurple,
      body: SafeArea(
        child: Column(
          children: [
            // Second Expand
            Expanded(
              flex: 3,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 60.0, horizontal: 0.0),
                child: Center(
                  child: Image.asset('assets/images/logo.png'),
                ),
              ),
            ),
            // First Expand
            Expanded(
              flex: 6,
              child: SingleChildScrollView(
                child: Form(
                  key: _formKennelKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      // Welcome text
                      const Text(
                        'Welcome Patron!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                      const SizedBox(
                        height: 45,
                      ),
                      // email field
                      TextFormField(
                        style: const TextStyle(
                          color: Colors.white60,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Email';
                          }

                          // Regular expression for basic email validation
                          String pattern =
                              r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
                          RegExp regex = RegExp(pattern);

                          if (!regex.hasMatch(value)) {
                            return 'Enter a valid email';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter email address',
                          hintStyle: const TextStyle(
                            color: Colors.white38,
                            fontWeight: FontWeight.w100,
                          ),
                          prefixIcon: ShaderMask(
                            shaderCallback: (bounds) => LinearGradient(
                              colors: [
                                ThemeColors.pinkPurple,
                                ThemeColors.lightBlue,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ).createShader(bounds),
                            child: const Icon(Icons.email_sharp,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // Password field
                      TextFormField(
                        style: const TextStyle(
                          color: Colors.white60,
                        ),
                        obscureText: true,
                        obscuringCharacter: '*',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter password.';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter password',
                          hintStyle: const TextStyle(
                            color: Colors.white38,
                            fontWeight: FontWeight.w100,
                          ),
                          prefixIcon: ShaderMask(
                            shaderCallback: (bounds) => LinearGradient(
                              colors: [
                                ThemeColors.pinkPurple,
                                ThemeColors.lightBlue,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ).createShader(bounds),
                            child: const Icon(Icons.lock_open_sharp,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      // Remember me
                      Row(
                        children: [
                          ShaderMask(
                            shaderCallback: (Rect bounds) {
                              return LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  ThemeColors.pinkPurple,
                                  ThemeColors.lightBlue,
                                ],
                              ).createShader(bounds);
                            },
                            child: Checkbox(
                              value: rememberPassword,
                              onChanged: (bool? value) {
                                setState(() {
                                  rememberPassword = value!;
                                });
                              },
                              activeColor: Colors
                                  .white, // Use white because the shader mask will replace the white color with the gradient
                              checkColor: Colors
                                  .black, // Check mark color, adjust accordingly
                            ),
                          ),
                          Text(
                            'Remember me',
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: ThemeColors.pinkPurple,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      // submit button
                      SizedBox(
                        width: double.infinity,
                        child: ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return LinearGradient(
                              colors: [
                                ThemeColors.pinkPurple,
                                ThemeColors.lightBlue,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ).createShader(bounds);
                          },
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors
                                  .white), // Use white, the gradient will replace this color
                              foregroundColor: MaterialStateProperty.all(
                                  Colors.black), // Set the text color
                            ),
                            onPressed: () {
                              if (_formKennelKey.currentState!.validate() &&
                                  rememberPassword) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content:
                                        Text('Please wait, signing in... '),
                                  ),
                                );
                              } else if (!rememberPassword) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text('Please click remember me')),
                                );
                              }
                            },
                            child: const Text(
                              'Sign In',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
