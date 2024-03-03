import 'dart:math';

import 'package:flutter/material.dart';
import 'package:to_do/widgets/Details.dart';

class HomeCard extends StatefulWidget {
  String title;
  List tasks;
  bool firstItem;
  int id;

  HomeCard({
    super.key,
    required this.title,
    required this.tasks,
    required this.firstItem,
    required this.id,
  });

  @override
  State<HomeCard> createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  bool checkedValue = false;
  var cl;
  var doneTasks = 0;
  var colors = {
    [Color.fromARGB(255, 161, 226, 196), Color.fromARGB(255, 3, 139, 74)],
    [Color.fromARGB(255, 255, 207, 180), Color.fromARGB(255, 255, 163, 111)],
    [Color.fromARGB(255, 208, 238, 248), Color.fromARGB(255, 87, 213, 255)],
    [Color.fromARGB(255, 255, 217, 225), Color.fromARGB(255, 255, 144, 167)]
  };

  checkDobeTask() async {
    print(widget.tasks.map((event) => {
          if (event['status'] == true) {doneTasks += 1}
        }));
    // widget.tasks.map((e){print('CU');});
  }

  @override
  void initState() {
    checkedValue;
    checkDobeTask();
    cl = (colors.toList()..shuffle()).first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return Card(
      color: cl[0],
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: SizedBox(
        width: screen.width - 100,
        child: ExpansionTile(
          initiallyExpanded: widget.firstItem,
          title: GestureDetector(
              onLongPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => Details(
                        title: widget.title,
                        cl: cl,
                        tasks: widget.tasks,
                        id: widget.id,
                      ),
                    ));
              },
              child: ListTile(
                title: Text(
                  widget.title,
                  style: TextStyle(
                      color: cl[1], fontSize: 25, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  '$doneTasks of ${widget.tasks.length} Tasks',
                  style: TextStyle(color: cl[1], fontWeight: FontWeight.w400),
                ),
              )),
          children: <Widget>[
            ListView.builder(
                shrinkWrap: true,
                itemCount: widget.tasks.length,
                itemBuilder: (_, idx) => CheckboxListTile(
                      activeColor: cl[1],
                      title: Text(
                        widget.tasks[idx]['task-name'],
                        style: TextStyle(
                            decoration: widget.tasks[idx]['status'] == true
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                            color: widget.tasks[idx]['status'] == true
                                ? cl[1]
                                : Colors.black),
                      ),
                      value: widget.tasks[idx]['status'],
                      onChanged: (newValue) {
                        Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) => Details(
                                title: widget.title,
                                cl: cl,
                                tasks: widget.tasks,
                                id: widget.id,
                              ),
                            ));
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                    )),
          ],
        ),
      ),
    );
  }
}
