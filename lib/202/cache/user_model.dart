// dogrudan bu objeyi encode edemiyor.
// bu element'i json' a ceviremiyor. Cunku mapleyemiyor.
// objeye cevirebilmem icin bana bunun json hali lazim..

class User {
  String? name;
  String? description;
  String? url;

  User(this.name, this.description, this.url);

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = this.name;
    data['description'] = this.description;
    data['url'] = this.url;
    return data;
  }
}
