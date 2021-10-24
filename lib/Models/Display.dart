
class Display {

  String _img;
  String _des;

  Display(this._img, this._des);

  String get des => _des;

  set des(String value) {
    _des = value;
  }

  String get img => _img;

  set img(String value) {
    _img = value;
  }
}