String mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return 'Server Failure';
    case DatabaseFailure:
      return 'Database Failure';
    default:
      return 'Unexpected Error';
  }
}
