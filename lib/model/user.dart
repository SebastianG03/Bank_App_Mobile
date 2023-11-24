class User {

  int _idUser;
  String _name;
  String _email;
  String _password;
  String _phone;
  String _role;
  String _dni;

  User.create(this._idUser, this._name, this._email, this._password, this._phone,
      this._role, this._dni);

  String get dni => _dni;

  set dni(String value) {
    _dni = value;
  }

  String get role => _role;

  set role(String value) {
    _role = value;
  }

  String get phone => _phone;

  set phone(String value) {
    _phone = value;
  }

  String get password => _password;

  set password(String value) {
    _password = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  int get idUser => _idUser;

  set idUser(int value) {
    _idUser = value;
  }
}


