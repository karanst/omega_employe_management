/// data : [{"id":"12","user_id":"236","images":["https://alphawizzserver.com/employee_management/uploads/spent_images/1687439966images5.jpg","https://alphawizzserver.com/employee_management/uploads/spent_images/1687439966download1.png","https://alphawizzserver.com/employee_management/uploads/spent_images/1687439966travel-category-mob.jpg"],"spent_type":"Travel","amount":"200","status":"0","latitude":"22.753284","longitude":"75.893700","address":"vijaynagar","create_at":"2023-06-22","update_at":"0000-00-00 00:00:00"},{"id":"13","user_id":"236","images":["https://alphawizzserver.com/employee_management/uploads/spent_images/1687513515playstore.png"],"spent_type":"Travel","amount":"5000","status":"0","latitude":"22.7468974","longitude":"75.8980235","address":"151, Ratna Lok Colony, Indore","create_at":"2023-06-23","update_at":"0000-00-00 00:00:00"},{"id":"14","user_id":"236","images":["https://alphawizzserver.com/employee_management/uploads/spent_images/1687513966playstore.png"],"spent_type":"Travel","amount":"5000","status":"0","latitude":"22.7468974","longitude":"75.8980235","address":"151, Ratna Lok Colony, Indore","create_at":"2023-06-23","update_at":"0000-00-00 00:00:00"},{"id":"15","user_id":"236","images":["https://alphawizzserver.com/employee_management/uploads/spent_images/1687514626images5.jpg","https://alphawizzserver.com/employee_management/uploads/spent_images/1687514626download1.png"],"spent_type":"Travel","amount":"200","status":"0","latitude":"22.753284","longitude":"75.893700","address":"vijaynagar","create_at":"2023-06-23","update_at":"0000-00-00 00:00:00"},{"id":"16","user_id":"236","images":["https://alphawizzserver.com/employee_management/uploads/spent_images/1687514658IMG-20230623-WA0000.jpg","https://alphawizzserver.com/employee_management/uploads/spent_images/1687514658Screenshot_2023-06-22-21-48-58-768-edit_com_linkedin_android.jpg","https://alphawizzserver.com/employee_management/uploads/spent_images/1687514658Screenshot_2023-06-22-19-09-21-238-edit_com_manubhaishadi.jpg"],"spent_type":"Travel","amount":"5000","status":"0","latitude":"22.7469121","longitude":"75.8979984","address":"151, Ratna Lok Colony, Indore","create_at":"2023-06-23","update_at":"0000-00-00 00:00:00"},{"id":"17","user_id":"236","images":["https://alphawizzserver.com/employee_management/uploads/spent_images/1687520104images5.jpg","https://alphawizzserver.com/employee_management/uploads/spent_images/1687520104download1.png"],"spent_type":"Travel","amount":"200","status":"0","latitude":"22.753284","longitude":"75.893700","address":"vijaynagar","create_at":"2023-06-23","update_at":"0000-00-00 00:00:00"},{"id":"18","user_id":"236","images":["https://alphawizzserver.com/employee_management/uploads/spent_images/1687520106images5.jpg","https://alphawizzserver.com/employee_management/uploads/spent_images/1687520106download1.png"],"spent_type":"Travel","amount":"200","status":"0","latitude":"22.753284","longitude":"75.893700","address":"vijaynagar","create_at":"2023-06-23","update_at":"0000-00-00 00:00:00"}]
/// error : false
/// message : "All spents"

class GetUserExpensesModel {
  GetUserExpensesModel({
      List<UserExpeses>? data,
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
        _data?.add(UserExpeses.fromJson(v));
      });
    }
    _error = json['error'];
    _message = json['message'];
  }
  List<UserExpeses>? _data;
  bool? _error;
  String? _message;
GetUserExpensesModel copyWith({  List<UserExpeses>? data,
  bool? error,
  String? message,
}) => GetUserExpensesModel(  data: data ?? _data,
  error: error ?? _error,
  message: message ?? _message,
);
  List<UserExpeses>? get data => _data;
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
/// spent_type : "Travel"
/// amount : "200"
/// status : "0"
/// latitude : "22.753284"
/// longitude : "75.893700"
/// address : "vijaynagar"
/// create_at : "2023-06-22"
/// update_at : "0000-00-00 00:00:00"

class UserExpeses {
  UserExpeses({
      String? id, 
      String? userId, 
      List<String>? images, 
      String? spentType, 
      String? amount, 
      String? status, 
      String? latitude, 
      String? longitude, 
      String? address, 
      String? createAt, 
      String? updateAt,}){
    _id = id;
    _userId = userId;
    _images = images;
    _spentType = spentType;
    _amount = amount;
    _status = status;
    _latitude = latitude;
    _longitude = longitude;
    _address = address;
    _createAt = createAt;
    _updateAt = updateAt;
}

  UserExpeses.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _images = json['images'] != null ? json['images'].cast<String>() : [];
    _spentType = json['spent_type'];
    _amount = json['amount'];
    _status = json['status'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _address = json['address'];
    _createAt = json['create_at'];
    _updateAt = json['update_at'];
  }
  String? _id;
  String? _userId;
  List<String>? _images;
  String? _spentType;
  String? _amount;
  String? _status;
  String? _latitude;
  String? _longitude;
  String? _address;
  String? _createAt;
  String? _updateAt;
UserExpeses copyWith({  String? id,
  String? userId,
  List<String>? images,
  String? spentType,
  String? amount,
  String? status,
  String? latitude,
  String? longitude,
  String? address,
  String? createAt,
  String? updateAt,
}) => UserExpeses(  id: id ?? _id,
  userId: userId ?? _userId,
  images: images ?? _images,
  spentType: spentType ?? _spentType,
  amount: amount ?? _amount,
  status: status ?? _status,
  latitude: latitude ?? _latitude,
  longitude: longitude ?? _longitude,
  address: address ?? _address,
  createAt: createAt ?? _createAt,
  updateAt: updateAt ?? _updateAt,
);
  String? get id => _id;
  String? get userId => _userId;
  List<String>? get images => _images;
  String? get spentType => _spentType;
  String? get amount => _amount;
  String? get status => _status;
  String? get latitude => _latitude;
  String? get longitude => _longitude;
  String? get address => _address;
  String? get createAt => _createAt;
  String? get updateAt => _updateAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['images'] = _images;
    map['spent_type'] = _spentType;
    map['amount'] = _amount;
    map['status'] = _status;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['address'] = _address;
    map['create_at'] = _createAt;
    map['update_at'] = _updateAt;
    return map;
  }

}