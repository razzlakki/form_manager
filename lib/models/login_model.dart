import '../models/base_res_model.dart';

class LoginModel extends BaseResModel {
  int messageCode;
  String message;
  LoginResource resource;

  LoginModel({this.messageCode, this.message, this.resource});

  LoginModel.fromJson(Map<String, dynamic> json) {
    messageCode = json['messageCode'];
    message = json['message'];
    resource = json['resource'] != null
        ? new LoginResource.fromJson(json['resource'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['messageCode'] = this.messageCode;
    data['message'] = this.message;
    if (this.resource != null) {
      data['resource'] = this.resource.toJson();
    }
    return data;
  }

  @override
  fromJson(Map<String, dynamic> json) {
    this.messageCode = json['messageCode'];
    this.message = json['message'];
    this.resource = json['resource'] != null
        ? new LoginResource.fromJson(json['resource'])
        : null;

    return this;
  }
}

class LoginResource {
  String username;
  List<int> groups;
  int roleId;
  String role;

  LoginResource({this.username, this.groups, this.roleId, this.role});

  factory LoginResource.fromJson(Map<String, dynamic> json) {
    return LoginResource(
      username: json['username'],
      groups: json['groups'].cast<int>(),
      roleId: json['role_id'],
      role: json['role'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['groups'] = this.groups;
    data['role_id'] = this.roleId;
    data['role'] = this.role;
    return data;
  }
}
