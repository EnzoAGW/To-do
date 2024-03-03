import 'dart:async';

import 'package:flutter/material.dart';
import 'package:to_do/dataset.dart';
import 'package:to_do/screens/Home.dart';
import 'package:to_do/widgets/NewTarsk.dart';

class Details extends StatefulWidget {
  String title;
  List tasks;
  List<Color> cl;
  int id;
  Details({
    super.key,
    required this.cl,
    required this.title,
    required this.tasks,
    required this.id,
  });

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  var doneTasks = 0;
  checkDobeTask() async {
    print(widget.tasks.map((event) => {
          if (event['status'] == true) {doneTasks += 1}
        }));
    // widget.tasks.map((e){print('CU');});
  }

  @override
  void initState() {
    checkDobeTask();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.blue),
          elevation: 0,
          actions: [
            IconButton(
                icon: const Icon(
                  Icons.save,
                  color: Colors.blue,
                ),
                onPressed: () {
                  showAdaptiveDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog.adaptive(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          title: Text('Saved')));

                  Timer(const Duration(seconds: 1), () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const Home()));
                  });
                })
          ],
          backgroundColor: Colors.transparent),

      // bottomNavigationBar: ,
      body: Column(
        children: [
          ListTile(
            minVerticalPadding: 20,
            title: Text(
              widget.title,
              style: TextStyle(
                  color: widget.cl[1],
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              '$doneTasks of ${widget.tasks.length} Tasks',
              style:
                  TextStyle(color: widget.cl[1], fontWeight: FontWeight.w400),
            ),
          ),
          const Divider(
            thickness: 2,
            indent: 20,
            endIndent: 20,
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: widget.tasks.length,
              itemBuilder: (_, idx) => CheckboxListTile(
                    activeColor: widget.cl[1],
                    title: Text(
                      widget.tasks[idx]['task-name'],
                      style: TextStyle(
                          decoration: widget.tasks[idx]['status'] == true
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                          color: widget.tasks[idx]['status'] == true
                              ? widget.cl[1]
                              : Colors.black),
                    ),
                    value: widget.tasks[idx]['status'],
                    onChanged: (newValue) {
                      setState(() {
                        widget.tasks[idx]['status'] = newValue;
                      });
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                  )),
          const Divider(
            thickness: 2,
            indent: 20,
            endIndent: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                  onTap: () {
                    showAdaptiveDialog(
                        context: context,
                        builder: (BuildContext context) => NewTask(
                              id: widget.id,
                            ));
                  },
                  child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Icon(
                        Icons.add,
                        color: Colors.blue,
                        size: 30,
                      ))),
              GestureDetector(
                  child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Icon(
                        Icons.delete,
                        color: Colors.blue,
                        size: 30,
                      ))),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: SizedBox(
                    width: screen.width - 70,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        categories.remove(categories[widget.id]);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => const Home()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12), // <-- Radius
                        ),
                      ),
                      child: const Text('Delete Board'),
                    ))),
          )
        ],
      ),
    );
  }
}
