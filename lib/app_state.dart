enum AppState {
  loading,
  loginScreen,
  mainView,

  //admin
  userList,
  categoryList,

  //security
  entrancesAndExits,
  createIncident,
  incidentLog,
  userLog,
  logDetails,
  internalFurniture,
  externalFurniture,

  //User
  checkFurniture,

  //Entrances and exits
  userEntrance,
  userExit,

  //CRUD
  userDetails,
  userDelete,
  userEdit,
  userCreate,

  categoryDetails,
  categoryDelete,
  categoryEdit,
  categoryCreate,

  internalDetails,
  internalDelete,
  internalEdit,
  internalCreate,

  externalDetails,
  externalDelete,
  externalEdit,
  externalCreate,

  profile,
  settings,

  error,
}

enum PopupSelection {
  profile,
  settings,
  logout,
}