class Entry {
  // instance variables
  DateTime _date;
  bool _isMedicationTaken;
  String _feeling; String _gratitude;

  // default constructor
  Entry(this._date) { _isMedicationTaken = null; _feeling = _gratitude = null; }

  String get gratitude => _gratitude;

  set gratitude(String value) {
    _gratitude = value;
  }

  String get feeling => _feeling;

  set feeling(String value) {
    _feeling = value;
  }

  bool get isMedicationTaken => _isMedicationTaken;

  set isMedicationTaken(bool value) {
    _isMedicationTaken = value;
  }
}