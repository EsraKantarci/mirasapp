import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(home: MyList()));

class MyList extends StatefulWidget {
  @override
  _MyListState createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  int value = 2;

  _addItem() {
    setState(() {
      value = value + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("MyApp"),
      ),
      body: ListView.builder(
          itemCount: this.value,
          itemBuilder: (context, index) => this._buildRow(index)),
      floatingActionButton: FloatingActionButton(
        onPressed: _addItem,
        child: Icon(Icons.add),
      ),
    );
  }

  _buildRow(int index) {
    return Text("Item " + index.toString());
  }
}