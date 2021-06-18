abstract class AmbulanceStates{}

class AmbulanceInitialState extends AmbulanceStates{
}

class AmbulanceLoadingState extends AmbulanceStates{}

class AmbulanceSuccessState extends AmbulanceStates{}

class AmbulanceErrorState extends AmbulanceStates
{
  final String error;

  AmbulanceErrorState(this.error);
}

class AmbulanceLoadLocation extends AmbulanceStates{}

class AmbulanceSuccessLocationState extends AmbulanceStates{}

class AmbulanceErrorLocationState extends AmbulanceStates
{
  final String error;

  AmbulanceErrorLocationState(this.error);
}


