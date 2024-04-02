/// name : "kirolos"
/// email : "kirolos1234@gmail.com"
/// role : "UserDto"

class UserDto {
  String? name;
  String? email;
  String? role;

  UserDto({
      this.name, 
      this.email, 
      this.role,});

  UserDto.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }

UserDto copyWith({  String? name,
  String? email,
  String? role,
}) => UserDto(  name: name ?? this.name,
  email: email ?? this.email,
  role: role ?? this.role,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['role'] = role;
    return map;
  }

}