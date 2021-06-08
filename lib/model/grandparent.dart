class Grandparent {
  String name;
  String side; // motherside - fatherside
  int id;
  int relation; // mother:0 - father:1
  bool isAlive;

  Grandparent({this.name = "",
    this.side = "",
    this.id = -1,
    this.relation = -1,
    this.isAlive = true
  });
}