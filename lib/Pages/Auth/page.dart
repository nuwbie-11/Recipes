import 'package:flutter/material.dart';
import 'package:restaurant_flutter/Components/logo.dart';
import 'package:restaurant_flutter/Pages/Auth/pref.dart';
import 'package:restaurant_flutter/Pages/Home/page.dart';

class Auth extends StatefulWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage("static/images/bg.png"),
        fit: BoxFit.fill,
      )),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Logo(),
            const Padding(
              padding: EdgeInsets.only(
                top: 150,
                left: 25,
                right: 25,
              ),
              child: Text(
                "Anyone Can Cook a Delicious Food !!",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                ),
              ),
            ),
            MyButtons(
              label: "LET'S BE A CHEFF!!",
              onPressed: () {
                setAuth();
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => HomePages()));
                ;
              },
            ),
          ],
        ),
      ),
    ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}

class MyButtons extends StatefulWidget {
  final String label;
  final void Function() onPressed;
  final bool isReversed;
  const MyButtons({
    Key? key,
    required this.label,
    required this.onPressed,
    this.isReversed = false,
  }) : super(key: key);

  @override
  State<MyButtons> createState() => _MyButtonsState();
}

class _MyButtonsState extends State<MyButtons> {
  // Color textColor = this.isReversed ? Colors.black : Colors.white;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: SizedBox(
        width: screenWidth - 40,
        child: ElevatedButton(
          onPressed: widget.onPressed,
          style: ElevatedButton.styleFrom(
            primary: widget.isReversed ? Colors.black : Colors.white,
          ),
          child: Text(
            widget.label,
            style: TextStyle(
              color: widget.isReversed ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
