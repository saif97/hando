import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:hando/infrastructure/firebase.dart';

// This is dependency injection. using this, I can access the singletons anywhere in the app.
final locator = GetIt.instance;

Future setupLocator() async {
  await Firebase.initializeApp();
  locator.registerLazySingleton<FirebaseFacade>(() => FirebaseFacade());
}
