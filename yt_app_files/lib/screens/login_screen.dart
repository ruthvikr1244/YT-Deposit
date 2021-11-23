import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import './otp_screen.dart';
//import 'src/authentication.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  _loginScreenState createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  @override
  Widget build(BuildContext context) {
    Color GTOrange = Color(0xFFF26522);
    Color GTBlue = Color(0xFF0F75BC);
    double logoWidth = 130;
    double logoHeight = logoWidth * 1.2;
    final mobileNumController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
          // ListView to be able to add the circles in the corner
          children: <Widget>[
            Padding(
                padding: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width - 100, 0, 0, 0),
                child: CustomPaint(
                  painter: bigLine(),
                )),
            SingleChildScrollView(
                child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.fromLTRB(0, 80, 0, 30),
                    child: Image.asset(
                      'assets/images/GrowTrustPillar.png',
                      height: logoHeight,
                      width: logoWidth,
                    )),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 50),
                  child: Text(
                    'Login',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.alata(
                        fontStyle: FontStyle.normal,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(40, 0, 40, 40),
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 3,
                                  color: Colors.grey.shade300,
                                  offset: Offset(0, 4),
                                  blurRadius: 3)
                            ]),
                        child: TextField(
                            controller: mobileNumController,
                            keyboardType: TextInputType.number,
                            maxLines: 1,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Enter Your Mobile Number',
                                hintStyle: TextStyle(color: Colors.grey[400]),
                                enabledBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                focusedBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    borderSide:
                                        BorderSide(color: Colors.white)))))),
                Padding(
                  padding: EdgeInsets.fromLTRB(80, 0, 80, 0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(GTOrange),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: BorderSide(color: GTOrange)))),
                    child: Text("Send OTP"),
                    onPressed: () {
                      if (mobileNumController.text.length == 10) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    otpScreen()));
                      } else {
                        AlertDialog(
                          content: Text("Please Enter a Valid Mobile Number"),
                        );
                      }
                    },
                  ),
                )
              ],
            )),
            CustomPaint(
              painter: bigCircle(),
            ),
            CustomPaint(
              painter: smolCircle(),
            ),
          ]),
    );
  }
}

class bigCircle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = Color(0xFFF26522)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(
        Offset(0, size.height + size.width / 2.3), size.width / 2.3, paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class smolCircle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = Color(0xFFF47A41)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(
        Offset(0, size.height + size.width / 2.3), size.width / 2.85, paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class testCircle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = Color(0xFFF47A41)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(0, 0), 160, paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class bigLine extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = Color(0xFF0F75BC)
      ..strokeWidth = 5
      ..style = PaintingStyle.fill;

    canvas.drawLine(
        Offset(size.width - 100, 0), Offset(size.width, 100), paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
