abstract class HistoryStates{}

class HistoryInitialState extends HistoryStates{}

class HistoryLoadingState extends HistoryStates{}

class HistorySuccessState extends HistoryStates{}

class HistoryErrorState extends HistoryStates
{
  final String error;

  HistoryErrorState(this.error);
}

class LogingoutState extends HistoryStates{}
class LogoutSuccessState extends HistoryStates{}
class LogoutFailedState extends HistoryStates{
  final String error;

  LogoutFailedState(this.error);

}


class HistoryFetchingState extends HistoryStates{}

class HistoryFetchSuccessState extends HistoryStates{}

class HistoryFetchErrorState extends HistoryStates
{
  final String error;

  HistoryFetchErrorState(this.error);

}

class DeleteingHistoryState extends HistoryStates{}

class DeleteHistorySuccessState extends HistoryStates{}

class DeleteHistoryFetchErrorState extends HistoryStates
{
  final String error;

  DeleteHistoryFetchErrorState(this.error);

}

class DatabaseEmpty extends HistoryStates{}
class DatabaseFull extends HistoryStates{}
