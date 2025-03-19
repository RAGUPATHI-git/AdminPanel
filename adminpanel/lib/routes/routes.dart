class Routes {
  //Authentication Routes
  static const String login = '/login';
  static const String forgorPassword = '/forgot-password';
  static const String logout = '/logout';

  //General Screens
  static const String dashBoard = '/dashboard';

  //ohter screens
  static const String maintenance = '/maintenance';
  static const String error_404 = '/404';

  //students
  static const String addStudent = '/add-student';

  //events
  static const String addevent = '/add-event';
  static const String editevent = '/edit-event';

  //test screens
  static const String test = '/test';
  static const String loading = '/loading';

  static List sideBarMenuItems = [
    login,
    dashBoard,
    forgorPassword,
    logout,
    dashBoard,
    event,
    maintenance,
    error_404,
    addStudent,
    test,
    loading
  ];
}
