// ignore_for_file: public_member_api_docs, sort_constructors_first, library_private_types_in_public_api
import 'package:flutter/material.dart';

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
      child: Card(
        margin: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    key: const ValueKey('username'),
                    validator: (value) {
                      if (value!.isEmpty || value.length < 4) {
                        return 'Enter more than 4 character';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Name',
                    ),
                    onSaved: (value) {
                      _username = value.toString();
                    },
                  ),
                  TextFormField(
                    key: const ValueKey('phone'),
                    validator: (value) {
                      if (value!.isEmpty || value.length != 10) {
                        return 'Enter correct phone number';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Phone',
                    ),
                    onSaved: (value) {
                      _phone = value.toString();
                    },
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 12),
                  DropdownButtonFormField<String>(
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

                  if (widget.isLoading) const CircularProgressIndicator(),
                  if (!widget.isLoading)
                    ElevatedButton(
                      onPressed: _trySubmit,
                      child: const Text('Submit'),
                    ),
                  // if (!widget.isLoading)
                  //   TextButton(
                  //     onPressed: () {
                  //       setState(() {
                  //         _isLogin = !_isLogin;
                  //       });
                  //     },
                  //     child: Text(
                  //         _isLogin ? 'Signup Instead' : 'Already signed in'),
                  //   ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
