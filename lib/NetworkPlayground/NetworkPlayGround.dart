import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';

class NetworkPlayground extends StatefulWidget {
  @override
  _NetworkPlaygroundState createState() => _NetworkPlaygroundState();
}

class _NetworkPlaygroundState extends State<NetworkPlayground> {
  bool _isLoading = false;
  Future<bool> _isNetworkActive() async {
    setState(() {
      _isLoading = true;
    });
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      try {
        Response response = await get('https://google.com');
        if (response.statusCode == 200) {
          setState(() {
            _isLoading = false;
          });
          return true;
        } else {
          setState(() {
            _isLoading = false;
          });
          return null;
        }
      } catch (e) {
        setState(() {
          _isLoading = false;
        });
        return null;
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Check if you have an internet connection.'),
              Builder(
                builder: (context) => RaisedButton(
                  color: Colors.blue,
                  onPressed: () async {
                    if (await _isNetworkActive() == true) {
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                            content: Text(
                                'You have an active internet connection.')),
                      );
                    } else {
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                            content: Text(
                                'You DO NOT have an active internet connection.')),
                      );
                    }
                  },
                  child: Text(
                    'Check',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              _isLoading ? CircularProgressIndicator() : SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
