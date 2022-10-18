import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../components/constants.dart';

class MapPage extends StatefulWidget {
  MapPage({required this.cityName, required this.countryName});
  static String id = 'map_screen';
  final String cityName;
  final String countryName;

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  static const double _defaultLat = 43.2220;
  static const double _defaultLong = 76.8512;

  static const CameraPosition _defaultLocation =
      CameraPosition(target: LatLng(_defaultLat, _defaultLong), zoom: 15);

  late final GoogleMapController _googleMapController;

  MapType _currentMapType = MapType.normal;
  final Set<Marker> _markers = {};

  void _changeMapType() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  Future<void> _moveToNewLocation() async {
    const _newPosition = LatLng(40.7128, -74.0060);
    _googleMapController.animateCamera(
      CameraUpdate.newLatLngZoom(_newPosition, 15),
    );
    setState(() {
      const marker = Marker(
        markerId: MarkerId('new location'),
        position: _newPosition,
        infoWindow: InfoWindow(title: 'ElectroTrack #2', snippet: 'Free'),
      );
      _markers
        ..clear()
        ..add(marker);
    });
  }

  Future<void> _goToDefaultLocation() async {
    const _defaultPosition = LatLng(_defaultLat, _defaultLong);
    _googleMapController.animateCamera(
      CameraUpdate.newLatLngZoom(_defaultPosition, 15),
    );

    setState(() {
      const marker = Marker(
        markerId: MarkerId('new location'),
        position: _defaultPosition,
        infoWindow: InfoWindow(title: 'ElectroTrack #1', snippet: 'Busy'),
      );
      _markers
        ..clear()
        ..add(marker);
    });
  }

  void _addMaker() {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId('default location'),
          position: _defaultLocation.target,
          icon: BitmapDescriptor.defaultMarker,
          infoWindow: InfoWindow(title: 'ElectroTrack #1', snippet: 'Busy'),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainThemeColor1,
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: (controller) => _googleMapController = controller,
            initialCameraPosition: _defaultLocation,
            markers: _markers,
            mapType: _currentMapType,
          ),
          Container(
            padding: EdgeInsets.only(top: 24, right: 12),
            alignment: Alignment.topRight,
            child: Column(
              children: [
                FloatingActionButton(
                  onPressed: _changeMapType,
                  backgroundColor: kElementsColor,
                  child: Icon(
                    Icons.map,
                    size: 30,
                  ),
                ),
                FloatingActionButton(
                  onPressed: _addMaker,
                  backgroundColor: kElementsColor,
                  child: Icon(
                    Icons.add_location,
                    size: 36,
                  ),
                ),
                SizedBox(
                  height: 36.0,
                ),
                FloatingActionButton(
                  onPressed: _moveToNewLocation,
                  backgroundColor: kElementsColor,
                  child: Icon(
                    Icons.location_city,
                    size: 36,
                  ),
                ),
                FloatingActionButton(
                  onPressed: _goToDefaultLocation,
                  backgroundColor: kElementsColor,
                  child: Icon(
                    Icons.home_rounded,
                    size: 36,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
