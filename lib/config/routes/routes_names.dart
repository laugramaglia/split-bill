class RoutesNav {
  // main
  static const String main = 'main';

  // Bills routes
  static const String allBills = 'bills';
  static const String editBill = 'edit';
  static const String addBill = 'add';

  // Groups routes
  static const String allGroups = 'groups';
  static const String addGroup = 'add';
  static const String editGroup = 'edit';

  // Profile routes
  static const String profile = 'profile';

  // Export routes
  static const String export = 'export';
}

// create extension
extension RoutesNavExt on String {
  String get navTo => '/$this';
  String navToWithParam(String param) => '$navTo/$param';
}
