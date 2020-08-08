import 'package:flutterhackathon/core/services/firebaseFoodServices.dart';
import 'package:flutterhackathon/core/services/firebaseUserService.dart';
import 'package:flutterhackathon/core/viewmodel/baseModel.dart';
import 'package:flutterhackathon/core/viewmodel/foodModel.dart';
import 'package:flutterhackathon/core/viewmodel/userModel.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;
void setupLocator() {
  locator.registerLazySingleton(() => BaseModel());
  locator.registerLazySingleton(() => FirebaseUserService());
  locator.registerLazySingleton(() => FirebaseFoodServices());
  locator.registerLazySingleton(() => FoodModel());
  locator.registerLazySingleton(() => UserModel());
}
