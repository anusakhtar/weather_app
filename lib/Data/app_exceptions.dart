class AppExceptions implements Exception {
  final String? Prefix;
  final String? message;

  AppExceptions({this.message, this.Prefix});

  @override
  String toString() {
    // TODO: implement toString
    return "$Prefix $message";
  }
}

class InternetException extends AppExceptions {
  InternetException([String? message]) : super(message: "Internet Error issues");
}

class RequestTimeOut extends AppExceptions {
  RequestTimeOut([String? message]) : super(message: "The request has TimeOut");
}

class ServerError extends AppExceptions {
  ServerError([String? message]) : super(message: "Internal server error occur");
}
class InvalidUrlException extends AppExceptions {
  InvalidUrlException([String? message]) : super(message: "The URL provided is invalid");
}
class FetchDataException extends AppExceptions {
  FetchDataException([String? message]) : super(message: "Failed to fetch data from the server");
}
