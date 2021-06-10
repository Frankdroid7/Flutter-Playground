import 'package:flutter/material.dart';

class CustomPaintAnimationPlayground extends StatefulWidget {
  @override
  _CustomPaintAnimationPlaygroundState createState() =>
      _CustomPaintAnimationPlaygroundState();
}

class _CustomPaintAnimationPlaygroundState
    extends State<CustomPaintAnimationPlayground>
    with TickerProviderStateMixin {
  Color firstLineColor = Colors.grey;
  Animation<double> _firstLineA,
      _secondLineA,
      _thirdLineA,
      _fourthLineA,
      _fifthLineA,
      _sixthLineA,
      _seventhLineA,
      _eighthLineA,
      _ninthLineA,
      _ninthLineA1,
      _tenthLineA,
      _tenthLineA1,
      _eleventhLineA,
      _eleventhLineA1,
      _twelfthLineA,
      _twelfthLineA1;
  AnimationController _firstLineAC,
      _secondLineAC,
      _thirdLineAC,
      _fourthLineAC,
      _fifthLineAC,
      _sixthLineAC,
      _seventhLineAC,
      _eighthLineAC,
      _ninthLineAC,
      _tenthLineAC,
      _eleventhLineAC,
      _twelfthLineAC;
  AnimationController _slideAnimationController;
  Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _slideAnimationController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    _slideAnimation = Tween<Offset>(begin: Offset.zero, end: Offset(0, -0.1))
        .animate(_slideAnimationController);

    _firstLineAC = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    _secondLineAC = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    _thirdLineAC = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    _fourthLineAC = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    _fifthLineAC = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );
    _sixthLineAC = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );
    _seventhLineAC = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );
    _eighthLineAC = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );
    _ninthLineAC = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );
    _tenthLineAC = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );
    _eleventhLineAC = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );

    _twelfthLineAC = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );

    _firstLineA = Tween<double>(begin: 0, end: 100).animate(_firstLineAC)
      ..addListener(() {
        setState(() {
          print('FIRST LINE ANIMATION: ${_firstLineA.value}');
        });
      });
    _secondLineA = Tween<double>(begin: -50, end: 50).animate(_secondLineAC)
      ..addListener(() {
        setState(() {
          print('SECOND LINE ANIMATION: ${_secondLineA.value}');
        });
      });
    _thirdLineA = Tween<double>(begin: -100, end: 0).animate(_thirdLineAC)
      ..addListener(() {
        setState(() {
          print('THIRD LINE ANIMATION: ${_thirdLineA.value}');
        });
      });
    _fourthLineA = Tween<double>(begin: 50, end: -50).animate(_fourthLineAC)
      ..addListener(() {
        setState(() {
          print('FOURTH LINE ANIMATION: ${_fourthLineA.value}');
        });
      });
    _fifthLineA = Tween<double>(begin: -50, end: 50).animate(_fifthLineAC)
      ..addListener(() {
        setState(() {
          print('FIFTH LINE ANIMATION: ${_fifthLineA.value}');
        });
      });
    _sixthLineA = Tween<double>(begin: 0, end: 100).animate(_sixthLineAC)
      ..addListener(() {
        setState(() {
          print('SIX LINE ANIMATION: ${_sixthLineA.value}');
        });
      });

    _seventhLineA = Tween<double>(begin: -50, end: 50).animate(_seventhLineAC)
      ..addListener(() {
        setState(() {
          print('SEVENTH LINE ANIMATION: ${_seventhLineA.value}');
        });
      });
    _eighthLineA = Tween<double>(begin: 100, end: 0).animate(_eighthLineAC)
      ..addListener(() {
        setState(() {
          print('EIGHTH LINE ANIMATION: ${_eighthLineA.value}');
        });
      });
    _ninthLineA = Tween<double>(begin: 0, end: 50).animate(_ninthLineAC)
      ..addListener(() {
        setState(() {
          print('NINTH LINE ANIMATION: ${_ninthLineA.value}');
        });
      });
    _ninthLineA1 = Tween<double>(begin: 0, end: 50).animate(_ninthLineAC)
      ..addListener(() {
        setState(() {
          print('NINTH1 LINE ANIMATION: ${_ninthLineA1.value}');
        });
      });
    _tenthLineA = Tween<double>(begin: 0, end: 50).animate(_tenthLineAC)
      ..addListener(() {
        setState(() {
          print('TENTH LINE ANIMATION: ${_tenthLineA.value}');
        });
      });
    _tenthLineA1 = Tween<double>(begin: 0, end: 50).animate(_tenthLineAC)
      ..addListener(() {
        setState(() {
          print('TENTH1 LINE ANIMATION: ${_tenthLineA1.value}');
        });
      });
    _eleventhLineA = Tween<double>(begin: 50, end: 0).animate(_eleventhLineAC)
      ..addListener(() {
        setState(() {
          print('ELEVENTH LINE ANIMATION: ${_eleventhLineA.value}');
        });
      });
    _eleventhLineA1 = Tween<double>(begin: 0, end: 50).animate(_eleventhLineAC)
      ..addListener(() {
        setState(() {
          print('ELEVENTH1 LINE ANIMATION: ${_eleventhLineA1.value}');
        });
      });
    _twelfthLineA = Tween<double>(begin: 50, end: 0).animate(_twelfthLineAC)
      ..addListener(() {
        setState(() {
          print('TWELFTH LINE ANIMATION: ${_eleventhLineA1.value}');
        });
      });
    _twelfthLineA1 = Tween<double>(begin: 0, end: 50).animate(_twelfthLineAC)
      ..addListener(() {
        setState(() {
          print('TWELFTH1 LINE ANIMATION: ${_eleventhLineA1.value}');
        });
      });

    _firstLineAC.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        print('FIRST LINE COMPLETED');
        _secondLineAC.forward();
        _secondLineA.addListener(() {
          setState(() {});
        });
      }
    });

    _secondLineAC.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        print('SECOND LINE COMPLETED');
        _thirdLineAC.forward();
        _thirdLineA.addListener(() {
          setState(() {});
        });
      }
    });
    _thirdLineAC.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        print('THIRD LINE COMPLETED');
        _fourthLineAC.forward();
        _fourthLineA.addListener(() {
          setState(() {});
        });
      }
    });
    _fourthLineAC.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        print('FOURTH LINE COMPLETED');
        _fifthLineAC.forward();
        _fifthLineA.addListener(() {
          setState(() {});
        });
      }
    });
    _fifthLineA.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        print('FIFTH LINE COMPLETED');
        _sixthLineAC.forward();
        _sixthLineA.addListener(() {
          setState(() {});
        });
      }
    });
    _sixthLineAC.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        print('SIXTH LINE COMPLETED');
        _seventhLineAC.forward();
        _seventhLineA.addListener(() {
          setState(() {});
        });
      }
    });
    _seventhLineAC.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        print('SEVENTH LINE COMPLETED');
        _eighthLineAC.forward();
        _eighthLineA.addListener(() {
          setState(() {});
        });
      }
    });
    _eighthLineAC.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        print('EIGHTH LINE COMPLETED');
        _ninthLineAC.forward();
        _ninthLineA.addListener(() {
          setState(() {});
        });
      }
    });
    _ninthLineAC.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        print('NINTH LINE COMPLETED');
        _tenthLineAC.forward();
        _tenthLineA.addListener(() {
          setState(() {});
        });
      }
    });
    _tenthLineAC.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        print('TENTH LINE COMPLETED');
        _eleventhLineAC.forward();
        _eleventhLineA.addListener(() {
          setState(() {});
        });
      }
    });
    _eleventhLineAC.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        print('ELEVENTH LINE COMPLETED');
        _twelfthLineAC.forward();
        _twelfthLineA.addListener(() {
          setState(() {});
        });
      }
    });
    _twelfthLineAC.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        print('TWELFTH LINE COMPLETED');
        _slideAnimationController.forward();
        _slideAnimationController.addListener(() {
          print(_slideAnimationController.value);
        });
        _slideAnimationController.addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            _slideAnimationController.reverse();
          } else if (status == AnimationStatus.dismissed) {
            _slideAnimationController.forward();
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _firstLineAC.dispose();
    _fifthLineAC.dispose();
    _sixthLineAC.dispose();
    _ninthLineAC.dispose();
    _tenthLineAC.dispose();
    _secondLineAC.dispose();
    _eighthLineAC.dispose();
    _fourthLineAC.dispose();
    _twelfthLineAC.dispose();
    _seventhLineAC.dispose();
    _eleventhLineAC.dispose();
    _slideAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: Container(
          width: deviceWidth,
          height: deviceHeight,
          child: Column(
            children: [
              Expanded(
                child: SlideTransition(
                  position: _slideAnimation,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CustomPaint(
                        painter:
                            FirstLinePainter(_firstLineA.value, firstLineColor),
                      ),
                      _firstLineA.value < 100
                          ? Container()
                          : CustomPaint(
                              painter: SecondLinePainter(_secondLineA.value),
                            ),
                      _secondLineA.value < 50
                          ? Container()
                          : CustomPaint(
                              painter: ThirdLinePainter(_thirdLineA.value),
                            ),
                      _thirdLineA.value < 0
                          ? Container()
                          : CustomPaint(
                              painter: FourthLinePainter(_fourthLineA.value),
                            ),
                      _fourthLineA.value > -50
                          ? Container()
                          : CustomPaint(
                              painter: FifthLinePainter(_fifthLineA.value),
                            ),
                      _fifthLineA.value == 50
                          ? CustomPaint(
                              painter: SixthLinePainter(_sixthLineA.value),
                            )
                          : Container(),
                      _sixthLineA.value == 100
                          ? CustomPaint(
                              painter: SeventhLinePainter(_seventhLineA.value),
                            )
                          : Container(),
                      _seventhLineA.value == 50
                          ? CustomPaint(
                              painter: EighthLinePainter(_eighthLineA.value),
                            )
                          : Container(),
                      _eighthLineA.value == 0
                          ? CustomPaint(
                              painter: NinthLinePainter(
                                  _ninthLineA.value, _ninthLineA1.value),
                            )
                          : Container(),
                      _ninthLineA.value == 50
                          ? CustomPaint(
                              painter: TenthLinePainter(
                                  _tenthLineA.value, _tenthLineA1.value),
                            )
                          : Container(),
                      _tenthLineA.value == 50
                          ? CustomPaint(
                              painter: EleventhLinePainter(
                                  _eleventhLineA.value, _eleventhLineA1.value),
                            )
                          : Container(),
                      _eleventhLineA.value == 0
                          ? CustomPaint(
                              painter: TwelfthLinePainter(
                                  _twelfthLineA.value, _twelfthLineA1.value),
                            )
                          : Container(),
                    ],
                  ),
                ),
              ),
              RaisedButton(
                color: Colors.blue,
                onPressed: () {
                  setState(() {
                    firstLineColor = Colors.red;
                  });
                  _firstLineAC.forward();
                },
                child: Text(
                  'DRAW CUBE',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RedContainer extends StatelessWidget {
  final Widget child;
  RedContainer({this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: child,
    );
  }
}

class FirstLinePainter extends CustomPainter {
  final Color lineColor;
  final double _firstLineACV;
  FirstLinePainter(this._firstLineACV, this.lineColor);

  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    Paint paint = Paint()
      ..color = lineColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    Path path = Path()
      ..moveTo(centerX - 50, centerY)
      ..lineTo(centerX - 50, centerY - _firstLineACV);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class SecondLinePainter extends CustomPainter {
  final double secondLineACV;
  SecondLinePainter(this.secondLineACV);
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.red
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    canvas.drawLine(Offset(size.width / 2 - 50, size.height / 2 - 100),
        Offset(size.width / 2 + secondLineACV, size.height / 2 - 100), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class ThirdLinePainter extends CustomPainter {
  final double thirdLineACV;
  ThirdLinePainter(this.thirdLineACV);
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.red
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    canvas.drawLine(Offset(size.width / 2 + 50, size.height / 2 - 100),
        Offset(size.width / 2 + 50, size.height / 2 + thirdLineACV), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class FourthLinePainter extends CustomPainter {
  final double fourthLineACV;
  FourthLinePainter(this.fourthLineACV);
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.red
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    canvas.drawLine(Offset(size.width / 2 + 50, size.height / 2),
        Offset(size.width / 2 + fourthLineACV, size.height / 2), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class FifthLinePainter extends CustomPainter {
  final double fifthLineACV;
  FifthLinePainter(this.fifthLineACV);
  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;

    Paint paint = Paint()
      ..color = Colors.red
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    Path path = Path()
      ..moveTo(centerX, centerY - 50)
      ..lineTo(centerX, centerY + fifthLineACV);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class SixthLinePainter extends CustomPainter {
  final double sixthLineACV;
  SixthLinePainter(this.sixthLineACV);
  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;

    Paint paint = Paint()
      ..color = Colors.red
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    Path path = Path()
      ..moveTo(centerX, centerY - 50)
      ..lineTo(centerX + sixthLineACV, centerY - 50);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class SeventhLinePainter extends CustomPainter {
  final double seventhLineACV;
  SeventhLinePainter(this.seventhLineACV);
  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;

    Paint paint = Paint()
      ..color = Colors.red
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    Path path = Path()
      ..moveTo(centerX + 100, centerY - 50)
      ..lineTo(centerX + 100, centerY + seventhLineACV);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class EighthLinePainter extends CustomPainter {
  final double eighthLineACV;
  EighthLinePainter(this.eighthLineACV);
  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;

    Paint paint = Paint()
      ..color = Colors.red
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    Path path = Path()
      ..moveTo(centerX + 100, centerY + 50)
      ..lineTo(centerX + eighthLineACV, centerY + 50);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class NinthLinePainter extends CustomPainter {
  final double ninthLineACV;
  final double ninthLineACV1;
  NinthLinePainter(this.ninthLineACV, this.ninthLineACV1);
  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;

    Paint paint = Paint()
      ..color = Colors.red
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    Path path = Path()
      ..moveTo(centerX + 50, centerY)
      ..lineTo(centerX + 50 + ninthLineACV, centerY + ninthLineACV1);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class TenthLinePainter extends CustomPainter {
  final double tenthLineACV;
  final double tenthLineACV1;
  TenthLinePainter(this.tenthLineACV, this.tenthLineACV1);
  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;

    Paint paint = Paint()
      ..color = Colors.red
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    Path path = Path()
      ..moveTo(centerX + 50, centerY - 100)
      ..lineTo(centerX + 50 + tenthLineACV, centerY - 100 + tenthLineACV1);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class EleventhLinePainter extends CustomPainter {
  final double eleventhLineACV;
  final double eleventhLineACV1;
  EleventhLinePainter(this.eleventhLineACV, this.eleventhLineACV1);
  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;

    Paint paint = Paint()
      ..color = Colors.red
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    Path path = Path()
      ..moveTo(centerX - 50, centerY)
      ..lineTo(centerX - eleventhLineACV, centerY + eleventhLineACV1);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class TwelfthLinePainter extends CustomPainter {
  final double twelfthLineACV;
  final double twelfthLineACV1;
  TwelfthLinePainter(this.twelfthLineACV, this.twelfthLineACV1);
  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;

    Paint paint = Paint()
      ..color = Colors.red
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    Path path = Path()
      ..moveTo(centerX - 50, centerY - 100)
      ..lineTo(centerX - 50 + twelfthLineACV1, centerY - 100 + twelfthLineACV1);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
