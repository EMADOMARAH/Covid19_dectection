abstract class SignUpStates{}

class SignUpInitialState extends SignUpStates{}

class SignUpLoadingState extends SignUpStates{}

class SignUpSuccessState extends SignUpStates{}

class SignUpErrorState extends SignUpStates
{
  final String error;

  SignUpErrorState(this.error);

}

class SignUpChangePasswordVisibilityState extends SignUpStates{}



class SignUpChangeUserTypeState extends SignUpStates{}


class SignUpCreateUserSuccessState extends SignUpStates{}

class SignUpCreateUserErrorState extends SignUpStates
{
  final String error;

  SignUpCreateUserErrorState(this.error);

}

