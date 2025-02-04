import 'package:flutter/material.dart';
import 'package:tiktok_clone_v2/features/authentication/widgets/form_button.dart';
import 'package:tiktok_clone_v2/features/onboarding/interests_screen.dart';

import '../../constants/gaps.dart';
import '../../constants/sizes.dart';

class LoginFormScreen extends StatefulWidget {
  const LoginFormScreen({super.key});

  @override
  State<LoginFormScreen> createState() => _LoginFormScreenState();
}

class _LoginFormScreenState extends State<LoginFormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Map<String, String> userData = {};

  bool _onSubmitTap() {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size36),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Gaps.v24,
              TextFormField(
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                  hintText: "Username",
                  hintStyle: const TextStyle(
                    color: Colors.black54,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null) return "plz input your name";

                  if (value.length < 3) {
                    return "your name more than 3";
                  }
                  return null;
                },
                onSaved: (username) {
                  userData["username"] = username.toString();
                },
              ),
              Gaps.v16,
              TextFormField(
                cursorColor: Theme.of(context).primaryColor,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Passsword",
                  hintStyle: const TextStyle(
                    color: Colors.black54,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null) return "plz input your name";

                  if (value.length < 8) {
                    return "your name more than 8";
                  }
                  return null;
                },
                onSaved: (password) {
                  userData["password"] = password.toString();
                },
              ),
              Gaps.v24,
              FormButton(
                disabled: false,
                text: "Log in",
                callback: _onSubmitTap,
                widget: const InterestsScreen(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
