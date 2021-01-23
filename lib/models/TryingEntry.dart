class TryingEntry {
  // instance variables
  DateTime _date; // when the Entry was made, to be millisSinceEpoch in SQLite database
  bool _isMedicationTaken; // whether medication is taken that day, to be 0 or 1 in SQLite database
  String _medicationDescription; // optional description based on settings, can be changed from day to day
  String _gratitude; // what is the user grateful for today? (can be empty)
  String _feeling; // what the user is feeling based on the Feeling Circle
  String _feelingJournal;  // can elaborate on feeling like a journal

  // database table and column names
  static final tableEntries = 'entries';
  static final columnDate = 'date';
  static final columnIsMedTaken = 'isMedTaken';
  static final columnMedDescription = 'medDescription';
  static final columnGratitude = 'gratitude';
  static final columnFeeling = 'feeling';
  static final columnFeelingJournal = 'feelingJournal';

  // constructors TODO: create a constructor based on saved data from given date
  // default
  TryingEntry() {
    _date = DateTime.now();
    _isMedicationTaken = false;
    _medicationDescription = "";
    _gratitude = "";
    _feeling = "";
    _feelingJournal = "";
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnDate: _date.millisecondsSinceEpoch,
      columnIsMedTaken: _isMedicationTaken ? 1 : 0,
      columnMedDescription: _medicationDescription,
      columnGratitude: _gratitude,
      columnFeeling: _feeling,
      columnFeelingJournal: _feelingJournal
    };

    return map;
  }
}