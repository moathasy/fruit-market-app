abstract class SignInStates{}

class SignInInitStates extends SignInStates{}

class SignInLoadingStates extends SignInStates{}

class SignInSuccessStates extends SignInStates{

  String ? msg;
  SignInSuccessStates({
    this.msg
  });
}

class SignInErrorStates extends SignInStates{

  String ? msgError;
  SignInErrorStates({
    this.msgError
  });
}

