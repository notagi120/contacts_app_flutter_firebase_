import 'package:contacts_app/controllers/crud_services.dart';
import 'package:flutter/material.dart';

class UpdateContact extends StatefulWidget {
  const UpdateContact(
      {super.key,
      required this.docID,
      required this.name,
      required this.phone,
      required this.email,
      required this.hobby,
      required this.notes});
  final String docID, name, phone, email, hobby, notes;

  @override
  State<UpdateContact> createState() => _UpdateContactState();
}

class _UpdateContactState extends State<UpdateContact> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _hobbyController = TextEditingController();
  TextEditingController _notesController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _emailController.text = widget.email;
    _phoneController.text = widget.phone;
    _nameController.text = widget.name;
    _hobbyController.text = widget.hobby;
    _notesController.text = widget.notes;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Update Contact")),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width * .9,
                    child: TextFormField(
                      validator: (value) =>
                          value!.isEmpty ? "Enter any name" : null,
                      controller: _nameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Name"),
                      ),
                    )),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width * .9,
                    child: TextFormField(
                      controller: _phoneController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Phone"),
                      ),
                    )),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width * .9,
                    child: TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Email"),
                      ),
                    )),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width * .9,
                    child: TextFormField(
                      controller: _hobbyController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Hobby"),
                        alignLabelWithHint: true, // Aligns the label at the top-left corner
                      ),
                      maxLines: 2, 
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.newline, 
                    ),
                  ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: TextFormField(
                    controller: _notesController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Notes"),
                      alignLabelWithHint: true, // Aligns the label at the top-left corner
                    ),
                    maxLines: 7, 
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.newline, // Adds new line on enter key
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                    height: 65,
                    width: MediaQuery.of(context).size.width * .9,
                    child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            CRUDService().updateContact(
                                _nameController.text,
                                _phoneController.text,
                                _emailController.text,
                                _hobbyController.text,
                                _notesController.text,
                                widget.docID);
                            Navigator.pop(context);
                          }
                        },
                        child: Text(
                          "Update",
                          style: TextStyle(fontSize: 16),
                        ))),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                    height: 65,
                    width: MediaQuery.of(context).size.width * .9,
                    child: OutlinedButton(
                        onPressed: () {
                          CRUDService().deleteContact(widget.docID);
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Delete",
                          style: TextStyle(fontSize: 16),
                        ))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
