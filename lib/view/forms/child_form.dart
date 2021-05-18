import 'package:flutter/material.dart';
import 'package:miras/model/child.dart';
import 'package:miras/model/constants.dart';

typedef OnDelete();

class ChildForm extends StatefulWidget {
  final Child child;
  final state = _ChildFormState();
  final OnDelete onDelete;

  ChildForm({this.child, this.onDelete});

  @override
  _ChildFormState createState() => state;

  bool isValid()=> state.validate();
}

class _ChildFormState extends State<ChildForm> {
  final form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Card(
        child: Form(
          key: form,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              AppBar(
                leading: Icon(Icons.people_alt),
                title: Text("Çocuk Formu"),
                centerTitle: true,
                backgroundColor: AppColors.mainColor.withOpacity(0.8),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: widget.onDelete,
                  ),
                ],
              ),

             Column(
                 children: [

                   // This will be automatically fetched in the next sprint.
                   Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextFormField(
                          initialValue: widget.child.parentName,
                          onSaved: (val)=>widget.child.parentName = val,
                          validator: (val)=> val.length > 1 ? null
                              : "Lütfen isim giriniz." ,
                          decoration: InputDecoration(
                              labelText: "Ebeveynin İsmi: ",
                              hintText: "Ebeveynlerden en az birinin ismini giriniz"
                          ),
                        ),
                      ),


               Padding(
                    padding: const EdgeInsets.all(8),
                    child: TextFormField(
                      initialValue: widget.child.childName,
                      onSaved: (val)=>widget.child.childName = val,
                      validator: (val)=> val.length > 1 ? null
                          : "Lütfen isim giriniz." ,
                      decoration: InputDecoration(
                        labelText: "Çocuğun İsmi: ",
                        hintText: "Çocuğun ismini giriniz"

                    ),
                  ),
                ),
                 ],
               ),

            ],
          ),
        ),
      ),
    );
  }

  // form validator for saving it to a list

bool validate(){
    var valid = form.currentState.validate();
    if(valid){
      form.currentState.save();
    }
    return valid;
}
}
