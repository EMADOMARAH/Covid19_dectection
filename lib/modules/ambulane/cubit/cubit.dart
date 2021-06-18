import 'package:covid_19/modules/ambulane/cubit/states.dart';
import 'package:covid_19/shared/network/local/cache_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class AmbulanceCubit extends Cubit<AmbulanceStates>{

  AmbulanceCubit() : super(AmbulanceInitialState());

  static AmbulanceCubit get(context) => BlocProvider.of(context);

  String userName = CacheHelper.getData(key: "userName");
  String address = "العاشر من رمضان";
  LocationData _currentPosition;
  Location location = Location();
  LatLng _initialcameraposition = LatLng(0.5937, 0.9629);

  String _dateTime;



    void getLoc() async{
      emit(AmbulanceLoadLocation());
      bool _serviceEnabled;
      PermissionStatus _permissionGranted;

      _serviceEnabled = await location.serviceEnabled().catchError((onError){
        emit(AmbulanceErrorLocationState(onError.toString()));
      });
      if (!_serviceEnabled) {
        _serviceEnabled = await location.requestService();
        if (!_serviceEnabled) {
          return;
        }
      }

      _permissionGranted = await location.hasPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await location.requestPermission();
        if (_permissionGranted != PermissionStatus.granted) {
          return;
        }
      }

      _currentPosition = await location.getLocation();
      _initialcameraposition = LatLng(_currentPosition.latitude,_currentPosition.longitude);
      location.onLocationChanged.listen((LocationData currentLocation) {
        _currentPosition = currentLocation;
        _initialcameraposition = LatLng(_currentPosition.latitude,_currentPosition.longitude);

        DateTime now = DateTime.now();
        //_dateTime = DateFormat('EEE d MMM kk:mm:ss ').format(now);
        _getAddress(_currentPosition.latitude, _currentPosition.longitude)
            .then((value) {
          address = "${value.first.addressLine}";
          emit(AmbulanceSuccessLocationState());


        });

      });
    }

    Future<List<Address>> _getAddress(double lat, double lang) async {
      final coordinates = new Coordinates(lat, lang);
      List<Address> add =
      await Geocoder.local.findAddressesFromCoordinates(coordinates);

      return add;
    }






}