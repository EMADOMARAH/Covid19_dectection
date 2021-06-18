abstract class DoctorsStates{}

class  DoctorsInitialState extends DoctorsStates{}

class  DoctorsLoadingState extends DoctorsStates{}

class  DoctorsSuccessState extends DoctorsStates{}

class  DoctorsErrorState extends DoctorsStates
{
  final String error;

  DoctorsErrorState(this.error);
}
