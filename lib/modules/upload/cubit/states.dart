abstract class UploadStates{}

class UploadInitialState extends UploadStates{}

class UploadLoadingState extends UploadStates{}

class UploadSuccessState extends UploadStates{}

class UploadErrorState extends UploadStates
{
  final String error;

  UploadErrorState(this.error);
}

// Image States
class LoadingImageState extends UploadStates{}
class SuccessImageState extends UploadStates{}
class ErrorImageState extends UploadStates{
  final String error;

  ErrorImageState(this.error);

}


// Upload States
class LoadingUploadImageState extends UploadStates{}
class SuccessUploadImageState extends UploadStates{}
class ErrorUploadImageState extends UploadStates{
  final String error;

  ErrorUploadImageState(this.error);

}


