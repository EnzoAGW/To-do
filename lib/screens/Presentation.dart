import 'package:flutter/material.dart';
import 'package:to_do/screens/Home.dart';

class Presentation extends StatelessWidget {
  const Presentation({super.key});

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          width: screen.width,
          height: screen.height,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [
              0.4,
              0.6,
            ],
            colors: [
              Color.fromARGB(255, 208, 238, 248),
              Color.fromARGB(255, 254, 251, 242),
            ],
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'assets/3961975.png',
                width: screen.width - 100,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Text('To-Do List',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w800,
                              color: Colors.black))),
                  const Padding(
                      padding: EdgeInsets.only(
                          left: 20, right: 20, bottom: 25, top: 0),
                      child: Text(
                        'maecenas vehicula ligula mauris, sed efficitur tortor tincidunt vitae.Suspendisse mattis viverra purus. Aenean dian risus, consequat rutum quam consectetur facilisis.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 107, 107, 107)),
                      )),
                  Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: SizedBox(
                          width: screen.width - 70,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute<void>(
                                    builder: (BuildContext context) =>
                                        const Home(),
                                  ));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(12), // <-- Radius
                              ),
                            ),
                            child: const Text('Get Started'),
                          )))
                ],
              )
            ],
          )),
    );
  }
}
