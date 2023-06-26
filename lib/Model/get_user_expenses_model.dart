/// data : [{"id":"12","user_id":"236","images":["https://alphawizzserver.com/employee_management/uploads/spent_images/1687439966images5.jpg","https://alphawizzserver.com/employee_management/uploads/spent_images/1687439966download1.png","https://alphawizzserver.com/employee_management/uploads/spent_images/1687439966travel-category-mob.jpg"],"spent_type":"18","sub_spent_type":"23","from":null,"to":null,"amount":"200","status":"0","latitude":"22.753284","longitude":"75.893700","address":"vijaynagar","description":null,"create_at":"2023-06-22","update_at":"2023-06-26 12:49:36","name":"Karan S Tomar","st":"Travel","sst":"Bus"},{"id":"13","user_id":"236","images":["https://alphawizzserver.com/employee_management/uploads/spent_images/1687513515playstore.png"],"spent_type":"18","sub_spent_type":"24","from":null,"to":null,"amount":"5000","status":"0","latitude":"22.7468974","longitude":"75.8980235","address":"151, Ratna Lok Colony, Indore","description":null,"create_at":"2023-06-23","update_at":"2023-06-26 12:49:45","name":"Karan S Tomar","st":"Travel","sst":"Auto"},{"id":"14","user_id":"236","images":["https://alphawizzserver.com/employee_management/uploads/spent_images/1687513966playstore.png"],"spent_type":"18","sub_spent_type":"23","from":"Indore","to":"Bhopal","amount":"5000","status":"0","latitude":"22.7468974","longitude":"75.8980235","address":"151, Ratna Lok Colony, Indore","description":"Lorem Ipsum is simply dummy text ","create_at":"2023-06-23","update_at":"2023-06-26 13:29:52","name":"Karan S Tomar","st":"Travel","sst":"Bus"},{"id":"15","user_id":"236","images":["https://alphawizzserver.com/employee_management/uploads/spent_images/1687514626images5.jpg","https://alphawizzserver.com/employee_management/uploads/spent_images/1687514626download1.png"],"spent_type":"18","sub_spent_type":"22","from":null,"to":null,"amount":"200","status":"0","latitude":"22.753284","longitude":"75.893700","address":"vijaynagar","description":null,"create_at":"2023-06-23","update_at":"2023-06-26 12:49:50","name":"Karan S Tomar","st":"Travel","sst":"Train"},{"id":"16","user_id":"236","images":["https://alphawizzserver.com/employee_management/uploads/spent_images/1687514658IMG-20230623-WA0000.jpg","https://alphawizzserver.com/employee_management/uploads/spent_images/1687514658Screenshot_2023-06-22-21-48-58-768-edit_com_linkedin_android.jpg","https://alphawizzserver.com/employee_management/uploads/spent_images/1687514658Screenshot_2023-06-22-19-09-21-238-edit_com_manubhaishadi.jpg"],"spent_type":"18","sub_spent_type":"25","from":null,"to":null,"amount":"5000","status":"0","latitude":"22.7469121","longitude":"75.8979984","address":"151, Ratna Lok Colony, Indore","description":null,"create_at":"2023-06-23","update_at":"2023-06-26 12:49:55","name":"Karan S Tomar","st":"Travel","sst":"Cab"},{"id":"20","user_id":"236","images":["https://alphawizzserver.com/employee_management/uploads/spent_images/1687784834IMG-20230623-WA0003.jpg"],"spent_type":"18","sub_spent_type":"22","from":"Indore","to":"Mumbai","amount":"1500","status":"0","latitude":"22.7469029","longitude":"75.8980236","address":"151, Ratna Lok Colony, Indore","description":"3rd AC - Avantika Express","create_at":"2023-06-26","update_at":"0000-00-00 00:00:00","name":"Karan S Tomar","st":"Travel","sst":"Train"}]
/// error : false
/// message : "All spents"

class GetUserExpensesModel {
  GetUserExpensesModel({
      List<UserExpenses>? data,
      bool? error, 
      String? message,}){
    _data = data;
    _error = error;
    _message = message;
}

  GetUserExpensesModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(UserExpenses.fromJson(v));
      });
    }
    _error = json['error'];
    _message = json['message'];
  }
  List<UserExpenses>? _data;
  bool? _error;
  String? _message;
GetUserExpensesModel copyWith({  List<UserExpenses>? data,
  bool? error,
  String? message,
}) => GetUserExpensesModel(  data: data ?? _data,
  error: error ?? _error,
  message: message ?? _message,
);
  List<UserExpenses>? get data => _data;
  bool? get error => _error;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['error'] = _error;
    map['message'] = _message;
    return map;
  }

}

/// id : "12"
/// user_id : "236"
/// images : ["https://alphawizzserver.com/employee_management/uploads/spent_images/1687439966images5.jpg","https://alphawizzserver.com/employee_management/uploads/spent_images/1687439966download1.png","https://alphawizzserver.com/employee_management/uploads/spent_images/1687439966travel-category-mob.jpg"]
/// spent_type : "18"
/// sub_spent_type : "23"
/// from : null
/// to : null
/// amount : "200"
/// status : "0"
/// latitude : "22.753284"
/// longitude : "75.893700"
/// address : "vijaynagar"
/// description : null
/// create_at : "2023-06-22"
/// update_at : "2023-06-26 12:49:36"
/// name : "Karan S Tomar"
/// st : "Travel"
/// sst : "Bus"

class UserExpenses {
  UserExpenses({
      String? id, 
      String? userId, 
      List<String>? images, 
      String? spentType, 
      String? subSpentType, 
      dynamic from, 
      dynamic to, 
      String? amount, 
      String? status, 
      String? latitude, 
      String? longitude, 
      String? address, 
      dynamic description, 
      String? createAt, 
      String? updateAt, 
      String? name, 
      String? st, 
      String? sst,}){
    _id = id;
    _userId = userId;
    _images = images;
    _spentType = spentType;
    _subSpentType = subSpentType;
    _from = from;
    _to = to;
    _amount = amount;
    _status = status;
    _latitude = latitude;
    _longitude = longitude;
    _address = address;
    _description = description;
    _createAt = createAt;
    _updateAt = updateAt;
    _name = name;
    _st = st;
    _sst = sst;
}

  UserExpenses.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _images = json['images'] != null ? json['images'].cast<String>() : [];
    _spentType = json['spent_type'];
    _subSpentType = json['sub_spent_type'];
    _from = json['from'];
    _to = json['to'];
    _amount = json['amount'];
    _status = json['status'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _address = json['address'];
    _description = json['description'];
    _createAt = json['create_at'];
    _updateAt = json['update_at'];
    _name = json['name'];
    _st = json['st'];
    _sst = json['sst'];
  }
  String? _id;
  String? _userId;
  List<String>? _images;
  String? _spentType;
  String? _subSpentType;
  dynamic _from;
  dynamic _to;
  String? _amount;
  String? _status;
  String? _latitude;
  String? _longitude;
  String? _address;
  dynamic _description;
  String? _createAt;
  String? _updateAt;
  String? _name;
  String? _st;
  String? _sst;
UserExpenses copyWith({  String? id,
  String? userId,
  List<String>? images,
  String? spentType,
  String? subSpentType,
  dynamic from,
  dynamic to,
  String? amount,
  String? status,
  String? latitude,
  String? longitude,
  String? address,
  dynamic description,
  String? createAt,
  String? updateAt,
  String? name,
  String? st,
  String? sst,
}) => UserExpenses(  id: id ?? _id,
  userId: userId ?? _userId,
  images: images ?? _images,
  spentType: spentType ?? _spentType,
  subSpentType: subSpentType ?? _subSpentType,
  from: from ?? _from,
  to: to ?? _to,
  amount: amount ?? _amount,
  status: status ?? _status,
  latitude: latitude ?? _latitude,
  longitude: longitude ?? _longitude,
  address: address ?? _address,
  description: description ?? _description,
  createAt: createAt ?? _createAt,
  updateAt: updateAt ?? _updateAt,
  name: name ?? _name,
  st: st ?? _st,
  sst: sst ?? _sst,
);
  String? get id => _id;
  String? get userId => _userId;
  List<String>? get images => _images;
  String? get spentType => _spentType;
  String? get subSpentType => _subSpentType;
  dynamic get from => _from;
  dynamic get to => _to;
  String? get amount => _amount;
  String? get status => _status;
  String? get latitude => _latitude;
  String? get longitude => _longitude;
  String? get address => _address;
  dynamic get description => _description;
  String? get createAt => _createAt;
  String? get updateAt => _updateAt;
  String? get name => _name;
  String? get st => _st;
  String? get sst => _sst;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['images'] = _images;
    map['spent_type'] = _spentType;
    map['sub_spent_type'] = _subSpentType;
    map['from'] = _from;
    map['to'] = _to;
    map['amount'] = _amount;
    map['status'] = _status;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['address'] = _address;
    map['description'] = _description;
    map['create_at'] = _createAt;
    map['update_at'] = _updateAt;
    map['name'] = _name;
    map['st'] = _st;
    map['sst'] = _sst;
    return map;
  }

}