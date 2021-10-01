import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hamtod_food/pages/home/home.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login';
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var input ='';
  String pass = '123456';
  var dot = 0;

  

  @override
  Widget build(BuildContext context) {

    List<Widget> iconList = [];
    for (var j = 0; j < dot; j++) {
      iconList.add(Icon(
        Icons.circle_rounded,
        color: Colors.deepPurple,
        size: 25.0,
      ));
    }
    for (var i = 0; i < (6 - dot); i++) {
      iconList.add(Icon(
        Icons.circle_rounded,
        color: Colors.white12,
        size: 25.0,
      ));
    }

    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg.jpg'),
                fit: BoxFit.cover
            )
            // gradient: LinearGradient(
            //   // ไล่เฉดจากมุมบนซ้ายไปมุมล่างขวาของ Container
            //   begin: Alignment.topLeft,
            //   end: Alignment.bottomRight,
            //   // ไล่เฉดจากสี..ไปสี..
            //   colors: [
            //     Colors.redAccent,
            //     Colors.purpleAccent,
            //   ],
            // ),
          ),

          child: SafeArea(
            child: Column(
              children: [
                Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                       children:[
                         Icon(
                           Icons.lock_outline_rounded,
                           size: 100,
                           color: Colors.indigoAccent
                         ),
                         Padding(
                           padding: const EdgeInsets.all(3.0),
                           child: Text(
                             'LOGIN',
                             style: GoogleFonts.mali(fontSize: 50,fontWeight: FontWeight.bold,color: Colors.white),

                           ),
                         ),
                         Padding(
                           padding: const EdgeInsets.all(3.0),
                           child: Text(
                             'Enter PIN to login',
                             style: Theme.of(context).textTheme.bodyText2,
                           ),
                         ),
                         Padding(
                           padding: const EdgeInsets.all(40.0),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [for (var item in iconList) item],
                           ),
                         )
                       ],
            ),
          ),
        
                Container(
                  //color: Colors.pink,
                  child: Column(
                    children: [
                      [1, 2, 3],
                      [4, 5, 6],
                      [7, 8, 9],
                      [-2, 0, -1],
                    ].map((row) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: row.map((item) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: LoginButton(
                              number: item,
                              onClick: _handleClickbutton,
                            ),
                          );
                        }).toList(),
                      );
                    }).toList(),
                  ),
                ),
                // Container(
                //     color: Colors.pinkAccent,
                //     child: Column(
                //       children: [
                //         for(var row=0; row<3; row++)
                //           Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //             children: [
                //               for(var col=1; col<=3; col++)
                //                 LoginButton(number: row * 3 + col),
                //             ],
                //           ),
                //       ],
                //     )
                // ),
              ],
            ),
          ),
        )
    );
  }
  void _handleClickbutton(int num) {
    setState(() {
      if (num == -1) {
        input = input.substring(0, input.length - 1);
        dot--;
      } else {
        input = input + '$num';
        dot++;
      }
      if (input.length == 6 && input != pass) {
        input = '';
        dot = 0;
        return _showMaterialDialog('ERROR', 'Invalid PIN. Please try again.');
      }else if(input.length == 6 && input == pass){
        input = '';
        dot = 0;
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => HomePage()));
      }
    });

  }



void _showMaterialDialog(String title, String msg) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          title,
          style: GoogleFonts.mali(fontSize: 30,color: Colors.red),
        ),
        content: Text(
          msg,
          style: GoogleFonts.mali(),
        ),
        actions: [
          TextButton(
            child: const Text('OK'),
            style: TextButton.styleFrom(
              textStyle: GoogleFonts.mali(color: Colors.blue,fontSize: 15),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
}
class LoginButton extends StatelessWidget {
  final int number;
  final Function(int) onClick;

  const LoginButton({
    required this.number,
    required this.onClick,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: CircleBorder(),
      onTap: number == -2 ? null : () => onClick(number), //กดปุ่มตัวเลข
      child: Container(
        width: 80.0,
        height: 80.0,
        decoration: number == -2
            ? null
            : BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 2.0,color: Colors.white70),
          boxShadow: [
            BoxShadow(
                color: Colors.pink.shade100,
                blurRadius: 10,
                offset: Offset(5, 5),
                spreadRadius: 1)
          ],
        ),
        child: Center(
          child: number >= 0
              ? Text(
            number.toString(),
            style: Theme.of(context).textTheme.headline4,
          )
              : (number == -1
              ? Icon(
            Icons.backspace_outlined,
            size: 28.0,
            color: Colors.black,
          )
              : SizedBox.shrink()),
        ),
      ),
    );
  }
}