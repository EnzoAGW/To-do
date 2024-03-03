import 'package:flutter/material.dart';
import 'package:to_do/dataset.dart';
import 'package:to_do/widgets/DefaultInput.dart';

class DeleteTask extends StatefulWidget {

  int id;
  DeleteTask({super.key,required this.id});

  @override
  State<DeleteTask> createState() => _DeleteTaskState();
}

class _DeleteTaskState extends State<DeleteTask> {
  var db = categories;

  TextEditingController title = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: Text('New Task',
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
                        onPressed: (){
                          var task = db.map((e) => e['id']==widget.id) as List;
                          task.add({
                            "task-name": title.text,
                            "status": false,
                          });
                          Navigator.pop(context);

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
