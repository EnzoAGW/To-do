import 'package:flutter/material.dart';
import 'package:to_do/dataset.dart';
import 'package:to_do/screens/Home.dart';
import 'package:to_do/widgets/DefaultInput.dart';

class DeleteTask extends StatefulWidget {
  int id;
  DeleteTask({super.key, required this.id});

  @override
  State<DeleteTask> createState() => _DeleteTaskState();
}

class _DeleteTaskState extends State<DeleteTask> {
  var db = categories;
  var task;
  List<String> userChecked = [];
  TextEditingController title = TextEditingController();

  getData() {
    for (var e in db) {
      if (e['id'] == widget.id) {
        task = e['tasks'];
      }
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: const Text('Delete Task',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              color: Colors.black,
            )),
        content: SizedBox(
          width: 200,
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(vertical: 20),
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: task.length,
                  itemBuilder: (_, i) => CheckboxListTile(
                        title: Text(
                          task[i]['task-name'],
                        ),
                        value: userChecked.contains(task[i]['task-name']),
                        onChanged: (newValue) {
                          _onSelected(newValue as bool, task[i]['task-name']);
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                      )),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: SizedBox(
                      width: screen.width - 70,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          if (task.length == 0 || task is List<dynamic>) {
                            task.removeWhere(
                                (e) => userChecked.contains(e['task-name']));

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const Home()));
                          } else {
                            var taskList = db[widget.id]['tasks']
                                as List<Map<String, Object>>;
                            taskList.removeWhere(
                                (e) => userChecked.contains(e['task-name']));

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const Home()));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(12), // <-- Radius
                          ),
                        ),
                        child: const Text('Delete'),
                      )))
            ],
          ),
        ));
  }

  void _onSelected(bool selected, String dataName) {
    if (selected == true) {
      setState(() {
        userChecked.add(dataName);
      });
    } else {
      setState(() {
        userChecked.remove(dataName);
      });
    }
  }
}
