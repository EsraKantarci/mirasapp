import 'package:flutter/material.dart';
import 'package:miras/model/constants.dart';

import 'child.dart';
typedef OnDelete();

class ChildForm extends StatefulWidget {
  final Child child;
  final state = _ChildFormState();
  final OnDelete onDelete;

  ChildForm({Key key, this.child, this.onDelete}) : super(key: key);
  @override
  _ChildFormState createState() => state;

  bool isValid() => state.validate();
}

class _ChildFormState extends State<ChildForm> {
  final form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Material(
        elevation: 1,
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(8),
        child: Form(
          key: form,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              AppBar(
                leading: Icon(Icons.verified_user),
                elevation: 0,
                title: Text("X'in Çocuğu"),
                backgroundColor: AppColors.mainColor.withOpacity(0.8),
                centerTitle: true,
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: widget.onDelete,
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                child: TextFormField(
                  initialValue: widget.child.childName,
                  onSaved: (val) => widget.child.childName = val,
                  validator: (val) =>
                  val.length > 0 ? null : 'Lütfen geçerli bir isim giriniz.',
                  decoration: InputDecoration(
                    labelText: 'İsim:',
                    hintText: 'Kişinin ismini giriniz...',
                    icon: Icon(Icons.person),
                    isDense: true,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, bottom: 24),
                child: TextFormField(
                  initialValue: widget.child.parentName,
                  onSaved: (val) => widget.child.parentName = val,
                  decoration: InputDecoration(
                    labelText: 'Ebeveyni kim?',
                    hintText: 'Şimdilik yazıyla yazdık, normalde eklendiği karttan alınacak',
                    icon: Icon(Icons.replay),
                    isDense: true,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  ///form validator
  bool validate() {
    var valid = form.currentState.validate();
    if (valid) form.currentState.save();
    return valid;
  }
}