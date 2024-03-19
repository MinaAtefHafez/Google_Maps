import "package:flutter/material.dart";
import "package:google_map/features/route_tracking/presentation/screens/route_tracking_screen.dart";

import "core/dependency_injection/dependency_injection.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait([
    DependencyInjection.init(),
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: RouteTrackingScreen());
  }
}



