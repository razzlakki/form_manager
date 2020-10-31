import 'package:get_it/get_it.dart';
import 'package:my_form_admin/services/navigationservice/navigation_services.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
}
