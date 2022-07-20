class ApiConstant {
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  const ApiConstant._();

  static const String commandMetadataLoad = "/rest/metadata/load";

  static const String commandDocumentLoad = "/rest/document/load";
  static const String commandDocumentCreate = "/rest/document/create";
  static const String commandDocumentInsert = "/rest/document/insert";
  static const String commandDocumentUpdate = "/rest/document/update";

  static const String commandDimensionQuery = "/rest/dimension/query";
  static const String commandCompositeQuery = "/rest/composite/query";

  static const String commandDimensionLoad = "/rest/dimension/load";

  static const String commandTransactionProcess = "/rest/transaction/process";

  static const String commandPageAuthenticate = "/rest/page/authenticate";

  // secret Key
  static const String secretKeyNurse =
      "u9h5HlRa8uHWzXjgwA4H0MRGipKDasJDSrak8p9Oyu5qCRWfGA3tgJv1Ev5fVhSar7uop7kaT3322vjGlM7mcfHMFM33bSjg8Qpe";

  static const String secretKeyPatient =
      "teMi95OWmtTcCiyEEygUQ1BLa5ZqoKRM516QylQqS05CWYuP7imfOBCMD9ogalPReS7AE0bOPT0LHsXKvxDPa4qH2Bwg7DXaCrbh";

  static const String secretKeyLab =
      "kiZjiFEXBLakdXJwfDEIGgRPaQLs2hmoXL6TdbgqRyzlKnfTEOvcoVCNxNOXgk9Y1IVADfRqyeOPBvEPaqrgOPUL9Zn9OBTgGRNT";

  static const String secretKeyNurseTask =
      "KqgxxCRGK02I60B269qlZItlVAdcmngPhiPCPodHyMOJDgoEAs6gF7yie7zRuYwG9AsitHTSFK8viUrxJPeOUlyT4DegcYIVtI2f";

  static const String secretKeyActivity =
      "A9bQDaaE9cuYRNWyo086QyG1ZZ20pROnbd0Vv0GErdtD7Zdk8mfp0WqW1QKmoVyiu41Pmf4S9TQvFfiHr4wQV5dJ2H5qf0t1jB3W";
}
