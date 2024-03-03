import 'package:flutter/material.dart';
import 'package:to_do/dataset.dart';
import 'package:to_do/widgets/DefaultInput.dart';

class NewBoard extends StatefulWidget {
  const NewBoard({super.key});

  @override
  State<NewBoard> createState() => _NewBoardState();
}

class _NewBoardState extends State<NewBoard> {
  var db = categories;

  TextEditingController title = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: const Text('New Board',
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
            padding: const EdgeInsets.symmetric(vertical: 20),
            children: [
              Center(
                  child: DefaultInput(
                controller: title,
                label: 'Title',
              )),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: SizedBox(
                      width: screen.width - 70,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: (){
                          db.add({
                            "id": (db.last["id"] as int) + 1,
                            "category": title.text,
                            "tasks": [],
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
