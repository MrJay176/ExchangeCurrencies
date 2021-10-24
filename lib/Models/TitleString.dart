
class TitleString {

  String _myDes;
  String _typeTitle;

  TitleString(this._myDes, this._typeTitle);

  String get typeTitle => _typeTitle;

  set typeTitle(String value) {
    _typeTitle = value;
  }

  String get myDes => _myDes;

  set myDes(String value) {
    _myDes = value;
  }

}
