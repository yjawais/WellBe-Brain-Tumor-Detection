// ignore_for_file: public_member_api_docs, sort_constructors_first, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:major_proj_sbj/common/gradient_button.dart';

// ignore: must_be_immutable
class AuthForm extends StatefulWidget {
  final void Function(
    String email,
    String password,
    //  String? username,
    bool isLogin,
    BuildContext ctx,
  ) submitFn;

  bool isLoading;

  AuthForm(
    this.submitFn,
    this.isLoading, {
    Key? key,
  }) : super(key: key);
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  var _isLogin = true;
  var _userEmail = '';
//  String? _userName = '';
  var _userPassword = '';

  void _trySubmit() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState?.save();
      widget.submitFn(
        _userEmail.trim(),
        _userPassword.trim(),
        //     _userName?.trim(),
        _isLogin,
        context,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child:
          //  Card(
          //   margin: const EdgeInsets.all(20),
          //   child:
          SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 2,
            horizontal: 25,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  _isLogin ? 'Login' : 'Sign Up',
                  style: const TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Material(
                  elevation: 2,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 60,
                    width: 325,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: const Color.fromARGB(255, 201, 223, 223),
                        width: 2,
                      ),
                    ),
                    margin: const EdgeInsets.all(1),
                    child: TextFormField(
                      key: const ValueKey('email'),
                      autocorrect: false,
                      textCapitalization: TextCapitalization.none,
                      validator: (value) {
                        if (value!.isEmpty || !value.contains('@')) {
                          return 'Enter valid email';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        border: InputBorder.none,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(
                            'assets/images/sms.png',
                            width: 24,
                            height: 24,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      onSaved: (value) {
                        _userEmail = value.toString();
                      },
                    ),
                  ),
                ),

                // if (!_isLogin)
                //   TextFormField(
                //     key: const ValueKey('username'),
                //     validator: (value) {
                //       if (value!.isEmpty || value.length < 4) {
                //         return 'Enter more than 4 character';
                //       }
                //       return null;
                //     },
                //     decoration: const InputDecoration(
                //       labelText: 'Username',
                //     ),
                //     onSaved: (value) {
                //       _userName = value!;
                //     },
                //   ),
                const SizedBox(
                  height: 10,
                ),
                Material(
                  elevation: 2,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 60,
                    width: 325,
                    margin: const EdgeInsets.all(1),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: const Color.fromARGB(255, 201, 223, 223),
                        width: 2,
                      ),
                    ),
                    child: TextFormField(
                      key: const ValueKey('password'),
                      validator: (value) {
                        if (value!.isEmpty || value.length < 7) {
                          return 'Enter password of atleast 7 character';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Password',
                        border: InputBorder.none,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(
                            'assets/images/lock.png',
                            width: 24,
                            height: 24,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      onSaved: (value) {
                        _userPassword = value.toString();
                      },
                      obscureText: true,
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                if (widget.isLoading) const CircularProgressIndicator(),
                if (!widget.isLoading)
                  // ElevatedButton(
                  //   onPressed: _trySubmit,
                  //   child: Text(_isLogin ? 'Login' : 'Sign Up'),
                  // ),
                  GradientButton(
                    text: _isLogin ? 'Login' : 'Sign Up',
                    function: _trySubmit,
                    buttonWidth: 300,
                  ),
                const SizedBox(
                  height: 15,
                ),
                if (!widget.isLoading)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _isLogin
                            ? 'Not registered yet?'
                            : 'Already have an account?',
                        style: const TextStyle(color: Colors.grey),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            _isLogin = !_isLogin;
                          });
                        },
                        child: Text(_isLogin ? 'Sign Up' : 'Login'),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
      // ),
    );
  }
}
