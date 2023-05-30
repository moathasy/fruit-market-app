abstract class SignUpStates{}

class SignUpInitStates extends SignUpStates{}

class SignUpLoadingStates extends SignUpStates{}

class SignUpSuccessStates extends SignUpStates{
String ? msg;
SignUpSuccessStates({this.msg});

}

class SignUpErrorStates extends SignUpStates{
String ? msgError;
SignUpErrorStates({this.msgError});

}

class SignUpPickDateStates extends SignUpStates{}