import 'package:flutter/material.dart';
import 'package:to_do/dataset.dart';
import 'package:to_do/screens/NewBoard.dart';
import 'package:to_do/screens/Presentation.dart';
import 'package:to_do/widgets/HomeCard.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var db = categories;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        },
        backgroundColor: Colors.blue,
        child: const Text(
          '+',
          style: TextStyle(
              fontSize: 30, color: Colors.white, fontWeight: FontWeight.w100),
        ),
      ),
      body: SizedBox(
          child: ListView(
            shrinkWrap: true,
            padding:EdgeInsets.symmetric(horizontal: 30),
        children: [
          Padding(
              padding: EdgeInsets.symmetric(vertical: 40),
              child: ListTile(
                  title: const Text(
                    'Tasks',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text('Create your categorised task boards'),
                  trailing: GestureDetector(
                      onTap: () {
                        showAdaptiveDialog(
                            context: context,
                            builder: (BuildContext context) => NewBoard());
                      },
                      child: Icon(
                        Icons.border_color,
                        color: Colors.blue,
                      )))),
          SingleChildScrollView(
            child: SizedBox(
                height: screen.height - 200,
                width: screen.width - 30,
                child: ListView.builder(
                    itemCount: db.length,
                    itemBuilder: (_, idx) => Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: HomeCard(
                          firstItem: idx == 0 ? true : false,
                          title: db[idx]['category'].toString(),
                          tasks: db[idx]['tasks'] as List,
                          id:db[idx]['id'] as int,
                        )))),
          )
          // HomeCard(),
          // HomeCard(),

          // ListView()
        ],
      )),
    );
  }
}
