import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:google_map/core/helpers/api_helper/api_consumer.dart';
import 'package:google_map/core/helpers/api_helper/dio_consumer.dart';
import 'package:google_map/core/helpers/location_helper/location_helper.dart';
import 'package:google_map/features/route_tracking/data/repository/route_tracking_repo.dart';
import 'package:google_map/features/route_tracking/logic/cubit/route_tracking_cubit.dart';

final di = GetIt.instance;

abstract class DependencyInjection {
  static Future<void> init() async {
    di.registerLazySingleton(() => LocationHelper());
    di.registerLazySingleton(() => Dio());
    di.registerLazySingleton<ApiConsumer>(() => DioConsumer(di()));

    di.registerLazySingleton<RouteTrackingRepo>(
        () => RouteTrackingRepoImpl(di()));
    di.registerLazySingleton(() => RouteTrackingCubit(di(), di()));
  }
}
