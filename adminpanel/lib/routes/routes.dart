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
  static const String studentList = '/student-list';

  //events
  static const String addevent = '/add-event';
  static const String editevent = '/edit-event';

  //syllabus
  static const String addSyllabus = '/addsyllabus';
  static const String allSyllabus = '/allsyllabus';

  //notes 
  static const String notes = '/notes';

  //profiles
   static const String profiles = '/profiles';

  //test screens
  static const String test = '/test';
  static const String loading = '/loading';

  static List sideBarMenuItems = [
    login,
    dashBoard,
    forgorPassword,
    logout,
    dashBoard,
    addevent,
    editevent,
    addSyllabus,
    allSyllabus,
    notes,
    profiles,
    maintenance,
    error_404,
    addStudent,
    test,
    loading
  ];
}
