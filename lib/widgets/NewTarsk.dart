import 'package:flutter/material.dart';
import 'package:to_do/dataset.dart';
import 'package:to_do/widgets/DefaultInput.dart';

class NewTask extends StatefulWidget {
  int id;
  NewTask({super.key, required this.id});

  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  var db;

  TextEditingController title = TextEditingController();

  @override
  void initState() {
    db = categories;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: const Text('New Task',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              color: Colors.black,
            )),
        content: SizedBox(
          height: 200,
          width: 200,
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(vertical: 20),
            children: [
              Center(
                  child: DefaultInput(
                controller: title,
                label: 'NewTask',
              )),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: SizedBox(
                      width: screen.width - 70,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          var newBaord = db[widget.id]['tasks'];
                          if (newBaord.length == 0 ||
                              newBaord is List<dynamic>) {
                            newBaord.add({
                              "id": 0,
                              "task-name": title.text,
                              "status": false,
                            });
                            Navigator.pop(context);
                          } else {
                            var taskList = db[widget.id]['tasks']
                                as List<Map<String, Object>>;
                            taskList.add({
                              "id": db[widget.id]['tasks'].last['id'] + 1,
                              "task-name": title.text,
                              "status": false,
                            });
                            Navigator.pop(context);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(12), // <-- Radius
                          ),
                        ),
                        child: const Text('Create'),
                      )))
            ],
          ),
        ));
  }
}
