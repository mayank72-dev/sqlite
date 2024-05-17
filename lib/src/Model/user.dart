class User {
  int? id;
  String? name;
  String? description;

  User({
     this.id,
     this.name,
     this.description,
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'name': name,
      'description': description,
    };
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }

  User.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    description = map['description'];
  }
}
