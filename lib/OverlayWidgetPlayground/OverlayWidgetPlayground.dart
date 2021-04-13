import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OverlayWidgetPlayground extends StatelessWidget {
  static final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    String userInput;
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Enter a 4 digit number.',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: 100,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: InputDecoration(
                      labelText: 'number',
                      border: OutlineInputBorder(),
                    ),
                    onSaved: (value) => userInput = value,
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith((states) {
                    if (states.contains(MaterialState.pressed)) {
                      _formKey.currentState.save();
                      if (userInput.length >= 4)
                        return Colors.blue;
                      else
                        return Colors.red;
                    }
                    return Colors.black;
                  })),
                  onPressed: () {
                    _formKey.currentState.save();
                    OverlayState overlayState = Overlay.of(context);
                    OverlayEntry overlayEntry = OverlayEntry(
                      builder: (context) => Positioned(
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Card(
                            margin: EdgeInsets.only(top: 24),
                            elevation: 18,
                            color: userInput.length >= 4
                                ? Colors.blue
                                : Colors.red,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                userInput.length >= 4
                                    ? 'Your entered: $userInput.'
                                    : 'Enter 4 or more digits.',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );

                    overlayState.insert(overlayEntry);
                    Future.delayed(
                        Duration(seconds: 3), () => overlayEntry.remove());
                  },
                  child: Text(
                    'SHOW OVERLAY',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
