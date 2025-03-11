class UserModel {
  UserModel({
      String? displayName, 
      String? email, 
      bool? isEmailVerified, 
      bool? isAnonymous, 
      Metadata? metadata, 
      dynamic phoneNumber, 
      dynamic photoURL, 
      List<ProviderData>? providerData, 
      dynamic refreshToken, 
      dynamic tenantId, 
      String? uid,}){
    _displayName = displayName;
    _email = email;
    _isEmailVerified = isEmailVerified;
    _isAnonymous = isAnonymous;
    _metadata = metadata;
    _phoneNumber = phoneNumber;
    _photoURL = photoURL;
    _providerData = providerData;
    _refreshToken = refreshToken;
    _tenantId = tenantId;
    _uid = uid;
}

  UserModel.fromJson(dynamic json) {
    _displayName = json['displayName'];
    _email = json['email'];
    _isEmailVerified = json['isEmailVerified'];
    _isAnonymous = json['isAnonymous'];
    _metadata = json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    _phoneNumber = json['phoneNumber'];
    _photoURL = json['photoURL'];
    if (json['providerData'] != null) {
      _providerData = [];
      json['providerData'].forEach((v) {
        _providerData?.add(ProviderData.fromJson(v));
      });
    }
    _refreshToken = json['refreshToken'];
    _tenantId = json['tenantId'];
    _uid = json['uid'];
  }
  String? _displayName;
  String? _email;
  bool? _isEmailVerified;
  bool? _isAnonymous;
  Metadata? _metadata;
  dynamic _phoneNumber;
  dynamic _photoURL;
  List<ProviderData>? _providerData;
  dynamic _refreshToken;
  dynamic _tenantId;
  String? _uid;

  String? get displayName => _displayName;
  String? get email => _email;
  bool? get isEmailVerified => _isEmailVerified;
  bool? get isAnonymous => _isAnonymous;
  Metadata? get metadata => _metadata;
  dynamic get phoneNumber => _phoneNumber;
  dynamic get photoURL => _photoURL;
  List<ProviderData>? get providerData => _providerData;
  dynamic get refreshToken => _refreshToken;
  dynamic get tenantId => _tenantId;
  String? get uid => _uid;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['displayName'] = _displayName;
    map['email'] = _email;
    map['isEmailVerified'] = _isEmailVerified;
    map['isAnonymous'] = _isAnonymous;
    if (_metadata != null) {
      map['metadata'] = _metadata?.toJson();
    }
    map['phoneNumber'] = _phoneNumber;
    map['photoURL'] = _photoURL;
    if (_providerData != null) {
      map['providerData'] = _providerData?.map((v) => v.toJson()).toList();
    }
    map['refreshToken'] = _refreshToken;
    map['tenantId'] = _tenantId;
    map['uid'] = _uid;
    return map;
  }

}

class ProviderData {
  ProviderData({
      String? displayName, 
      String? email, 
      dynamic phoneNumber, 
      dynamic photoURL, 
      String? providerId, 
      String? uid,}){
    _displayName = displayName;
    _email = email;
    _phoneNumber = phoneNumber;
    _photoURL = photoURL;
    _providerId = providerId;
    _uid = uid;
}

  ProviderData.fromJson(dynamic json) {
    _displayName = json['displayName'];
    _email = json['email'];
    _phoneNumber = json['phoneNumber'];
    _photoURL = json['photoURL'];
    _providerId = json['providerId'];
    _uid = json['uid'];
  }
  String? _displayName;
  String? _email;
  dynamic _phoneNumber;
  dynamic _photoURL;
  String? _providerId;
  String? _uid;

  String? get displayName => _displayName;
  String? get email => _email;
  dynamic get phoneNumber => _phoneNumber;
  dynamic get photoURL => _photoURL;
  String? get providerId => _providerId;
  String? get uid => _uid;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['displayName'] = _displayName;
    map['email'] = _email;
    map['phoneNumber'] = _phoneNumber;
    map['photoURL'] = _photoURL;
    map['providerId'] = _providerId;
    map['uid'] = _uid;
    return map;
  }

}

class Metadata {
  Metadata({
      String? creationTime, 
      String? lastSignInTime,}){
    _creationTime = creationTime;
    _lastSignInTime = lastSignInTime;
}

  Metadata.fromJson(dynamic json) {
    _creationTime = json['creationTime'];
    _lastSignInTime = json['lastSignInTime'];
  }
  String? _creationTime;
  String? _lastSignInTime;

  String? get creationTime => _creationTime;
  String? get lastSignInTime => _lastSignInTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['creationTime'] = _creationTime;
    map['lastSignInTime'] = _lastSignInTime;
    return map;
  }

}