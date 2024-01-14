import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:savorsip/Models/rating.dart';

class MapScreen extends StatefulWidget {
  final String userID;
  const MapScreen({Key? key, required this.userID}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Set<Marker> _markers = {};
  Future<Position>? _currentLocationFuture;

  @override
  void initState() {
    super.initState();
    _loadUserRatings();
    _currentLocationFuture = _determinePosition();
  }

Future<void> _loadUserRatings() async {
  List<Map<String, dynamic>> userRatings = await Rating.fetchUserRatingsWithWineNames(widget.userID);

  // Create a custom icon from an asset
  final BitmapDescriptor customIcon = await BitmapDescriptor.fromAssetImage(
    const ImageConfiguration(), 
    'assets/images/pin.png' // Replace with the path to your custom icon in the assets folder
  );

  // Check if the widget is still in the widget tree
  if (!mounted) return;
  setState(() {
    _markers = userRatings.map((rating) {
      return Marker(
        markerId: MarkerId(rating['wid']),
        position: LatLng(rating['latitude'] ?? 0, rating['longitude'] ?? 0),
        infoWindow: InfoWindow(title: rating['wineName'], snippet: 'Rating: ${rating['rating']}'),
        icon: customIcon, // Use the custom icon
      );
    }).toSet();
  });
}


  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
  
    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    } 

    return await Geolocator.getCurrentPosition();
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Ratings Map')),
      body: FutureBuilder<Position>(
        future: _currentLocationFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            // Handle error or return a default location
            return Center(child: Text('Error fetching location'));
          }
          // Assuming the snapshot has data at this point
          Position userLocation = snapshot.data!;
          CameraPosition initialCameraPosition = CameraPosition(
            target: LatLng(userLocation.latitude, userLocation.longitude),
            zoom: 15,
          );

          return GoogleMap(
            initialCameraPosition: initialCameraPosition,
            markers: _markers,
          );
        },
      ),
    );
  }
}