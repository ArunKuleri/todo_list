import 'package:flutter/material.dart';
import 'package:flutter_application_1/util/my_button.dart';

// ignore: must_be_immutable
class DialogBox extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox({
    Key? key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  }) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: AlertDialog(
          backgroundColor: Colors.blueAccent[300],
          content: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextFormField(
                      controller: controller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Add a new Task",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please enter some text';
                        }
                        return null;
                      }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MyButton(
                          text: 'save',
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              onSave();
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("pleease enter a text")));
                            }
                          }),
                      const SizedBox(
                        width: 8,
                      ),
                      MyButton(text: 'cancel', onPressed: onCancel),
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}
