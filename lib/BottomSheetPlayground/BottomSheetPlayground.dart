import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_playground/main.dart';

class BottomSheetPlayground extends StatelessWidget {
  final TextEditingController _txtCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'How many bottom sheet do you want?',
                style: TextStyle(fontSize: 28),
              ),
              SizedBox(height: 15.0),
              SizedBox(
                width: 120,
                height: 50,
                child: TextField(
                  controller: _txtCtrl,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    hintMaxLines: 1,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              RaisedButton(
                color: Colors.teal,
                onPressed: () {
                  revealModalBottomSheet(
                    context: context,
                    howMany: int.parse(_txtCtrl.text),
                  );
                },
                child: Text(
                  'Show Bottom Sheets',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

revealModalBottomSheet({
  @required BuildContext context,
  @required int howMany,
  bool popFirst =
      false, //To know whether to dismiss the bottomSheet that is currently showing.
}) {
  if (popFirst == true) Navigator.pop(context);

  for (int i = howMany; i >= 1; i--) {
    print(i);
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Builder(
          builder: (context) {
            return Container(
              height: deviceHeight * i / 10,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Column(
                  children: [
                    Container(
                      height: 1.5,
                      width: 120.0,
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 14.0,
                            horizontal: 10.0,
                          ),
                          child: Text('BOTTOM SHEET: ${i}'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
