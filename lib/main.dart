import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController _fullName = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phoneNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Form(
            autovalidate: true,
            key: formKey,
            child: Column(
              children: [
                InputTextWidget(
                  hintText: "full Name",
                  keyboardType: TextInputType.text,
                  keyboardAction: null,
                  inputController: _fullName,
                  validator: (value) {
                    if (value.isEmpty) return "Full Name field is required";
                    return null;
                  },
                ),
                SizedBox(height: 20),
                InputTextWidget(
                  hintText: "Email Address",
                  keyboardType: TextInputType.emailAddress,
                  keyboardAction: null,
                  inputController: _email,
                  validator: (String value) {
                    if (value.isEmpty) return "Email field is required";
                    if (!Helper.validateEmailAddress(value))
                      return "Invalid email address";
                    return null;
                  },
                ),
                SizedBox(height: 20),
                InputTextWidget(
                  hintText: "Phone Number",
                  keyboardType: TextInputType.phone,
                  keyboardAction: null,
                  inputController: _phoneNumber,
                  validator: (String value) {
                    if (value.isEmpty) return "Phone Number field is required";
                    if (!Helper.validatePhoneNumber(value, 10))
                      return "Invalid Phone Number";
                    return null;
                  },
                ),
                RaisedButton(
                  onPressed: () {
                    if (formKey.currentState.validate()) {
                      print('VALIDATED');
                    } else {
                      print('NOT VALIDATED');
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InputTextWidget extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final TextInputAction keyboardAction;
  final TextEditingController inputController;
  final double height;
  final FormFieldValidator<String> validator;

  const InputTextWidget(
      {Key key,
      @required this.hintText,
      @required this.keyboardType,
      @required this.keyboardAction,
      @required this.inputController,
      this.validator,
      this.height = 50})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormField(
        validator: (value) {
      if (value != null) {
        return validator(value);
      } else {
        return '';
      }
    }, builder: (FormFieldState formFieldState) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: height,
            width: double.maxFinite,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green),
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: TextFormField(
              // Notify the FormField State of Changes
              onChanged: (String value) {
                formFieldState.didChange(value);
              },
              controller: inputController,
              style: TextStyle(fontSize: 14),
              keyboardType: keyboardType,
              textInputAction: keyboardAction,
              decoration:
                  InputDecoration.collapsed(hintText: hintText).copyWith(
                hasFloatingPlaceholder: false,
                contentPadding: EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 10,
                ),

              ),
            ),
          ),
          // Show Form Field Error
          _showError(formFieldState),
        ],
      );
    });
  }

  Widget _showError(FormFieldState formFieldState) {
    if (formFieldState.hasError)
      return Padding(
        padding: EdgeInsets.only(left: 8.0, top: 5),
        child: Text(
          formFieldState.errorText,
          style: TextStyle(
            color: Colors.yellow,
            fontWeight: FontWeight.w500,
            fontSize: 10,
          ),
        ),
      );
    return SizedBox();
  }
}

class Helper {
  static bool validateEmailAddress(String value) {
    RegExp regExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
    if (!regExp.hasMatch(value)) {
      return false;
    } else {
      return true;
    }
  }

  static bool validatePhoneNumber(String value, int length) {
    print(value.length);
    if (value.length == length) {
      return true;
    }
    return false;
  }
}
