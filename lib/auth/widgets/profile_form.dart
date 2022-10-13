// ignore_for_file: public_member_api_docs, sort_constructors_first, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:major_proj_sbj/common/gradient_button.dart';

// ignore: must_be_immutable
class ProfileForm extends StatefulWidget {
  final void Function(
    String username,
    String phone,
    String userType,
    BuildContext ctx,
  ) submitFn;

  bool isLoading;

  ProfileForm(
    this.submitFn,
    this.isLoading, {
    Key? key,
  }) : super(key: key);
  @override
  _ProfileFormState createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  final _formKey = GlobalKey<FormState>();
  var _phone = '';
  var _username = '';
  var _userType = "";
  void _trySubmit() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState?.save();
      widget.submitFn(
        _username.trim(),
        _phone.trim(),
        _userType.trim(),
        context,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      // child: Card(
      //   margin: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
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
                        key: const ValueKey('username'),
                        validator: (value) {
                          if (value!.isEmpty || value.length < 4) {
                            return 'Enter more than 4 character';
                          }
                          return null;
                        },
                        decoration:  InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Name',
                          prefixIcon: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(
                            'assets/images/User.png',
                            width: 24,
                            height: 24,
                            fit: BoxFit.fill,
                          ),
                        ),
                        ),
                        onSaved: (value) {
                          _username = value.toString();
                        },
                      ),
                    ),
                  ),
                    const SizedBox(height: 12),
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
                        key: const ValueKey('phone'),
                        validator: (value) {
                          if (value!.isEmpty || value.length != 10) {
                            return 'Enter correct phone number';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Phone',
                          border: InputBorder.none,
                          prefixIcon: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(
                            'assets/images/call.png',
                            width: 24,
                            height: 24,
                            fit: BoxFit.fill,
                          ),
                        ),
                        ),
                        onSaved: (value) {
                          _phone = value.toString();
                        },
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
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
                      child: DropdownButtonFormField<String>(
                        
                        decoration:  InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(
                            'assets/images/User.png',
                            width: 24,
                            height: 24,
                            fit: BoxFit.fill,
                          ),
                        ),
                        ),
                        hint: const Text("Select type of user."),
                        isExpanded: true,
                        items: <String>[
                          'Doctor',
                          'Patient',
                        ].map((String type) {
                          return DropdownMenuItem<String>(
                            value: type,
                            child: Text(type),
                          );
                        }).toList(),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Select type of user.';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            value = value;
                          });
                        },
                        onSaved: (value) {
                          _userType = value.toString();
                        },
                      ),
                    ),
                  ),
                    const SizedBox(height: 50),
                  if (widget.isLoading) const CircularProgressIndicator(),
                  if (!widget.isLoading)
                    GradientButton(
                      function: _trySubmit,
                      text: 'Submit',
                      buttonWidth: 300,
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
