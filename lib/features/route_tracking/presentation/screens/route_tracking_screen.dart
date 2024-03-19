import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_map/core/dependency_injection/dependency_injection.dart';
import 'package:google_map/core/extensions/media_query_extension.dart';
import 'package:google_map/features/route_tracking/logic/cubit/route_tracking_cubit.dart';
import 'package:google_map/features/route_tracking/logic/cubit/route_tracking_state.dart';
import 'package:google_map/features/route_tracking/presentation/widgets/custom_google_maps.dart';
import 'package:google_map/features/route_tracking/presentation/widgets/places_list_view.dart';
import 'package:google_map/features/route_tracking/presentation/widgets/places_text_field.dart';

class RouteTrackingScreen extends StatefulWidget {
  const RouteTrackingScreen({super.key});

  @override
  State<RouteTrackingScreen> createState() => _RouteTrackingScreenState();
}

class _RouteTrackingScreenState extends State<RouteTrackingScreen> {
  final routeTrackingCubit = di<RouteTrackingCubit>();
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (controller.text.isNotEmpty) {
        routeTrackingCubit.getPlaces(place: controller.text);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: routeTrackingCubit,
      child: Scaffold(body: SafeArea(
        child: BlocBuilder<RouteTrackingCubit, RouteTrackingState>(
          builder: (context, state) {
            return BlurryModalProgressHUD(
              inAsyncCall:
                  state is GetPlaceDetailsLoading || state is GetRoutesLoading,
              opacity: 0.5,
              progressIndicator: const CircularProgressIndicator(),
              child: Stack(children: [
                const CustomGoogleMaps(),
                Positioned(
                  top: context.height * 0.02,
                  left: context.width * 0.03,
                  right: context.width * 0.03,
                  child: Column(
                    children: [
                      SizedBox(
                        height: context.height * 0.06,
                        child: PlacesTextField(
                          controller: controller,
                        ),
                      ),
                      const SizedBox(height: 20),
                      if (controller.text.isNotEmpty &&
                          routeTrackingCubit.isPlacesEmpty)
                        PlacesListView(
                            onTap: (index) {
                              controller.clear();
                              final place = routeTrackingCubit
                                  .placeModel!.predictions![index];
                              routeTrackingCubit.choosePlace(place: place);
                            },
                            placeModel: routeTrackingCubit.placeModel!),
                    ],
                  ),
                ),
              ]),
            );
          },
        ),
      )),
    );
  }
}
