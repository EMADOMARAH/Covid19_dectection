abstract class ResultStates{}

class ResultInitialState extends ResultStates{}

class ResultLoadingState extends ResultStates{}

class ResultSuccessState extends ResultStates{}

class ResultErrorState extends ResultStates
{
  final String error;

  ResultErrorState(this.error);
}