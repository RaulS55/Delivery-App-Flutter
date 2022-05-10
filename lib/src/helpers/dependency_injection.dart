import 'package:deliveryproyect/src/data/providers/local/authentication_client.dart';
import 'package:deliveryproyect/src/data/providers/local/preference_provider.dart';
import 'package:deliveryproyect/src/data/providers/remote/account_provider.dart';
import 'package:deliveryproyect/src/data/providers/remote/authentication_provider.dart';
import 'package:deliveryproyect/src/data/providers/remote/food_menu_provider.dart';
import 'package:deliveryproyect/src/data/providers/remote/websocket_provider.dart';
import 'package:deliveryproyect/src/data/repositories/account_repository.dart';
import 'package:deliveryproyect/src/data/repositories/authentication_repository.dart';
import 'package:deliveryproyect/src/data/repositories/food_menu_repository.dart';
import 'package:deliveryproyect/src/data/repositories/preference_repository.dart';
import 'package:deliveryproyect/src/data/repositories/websocket_repository.dart';
import 'package:deliveryproyect/src/data/repositories_implementation/account_repository_imp.dart';
import 'package:deliveryproyect/src/data/repositories_implementation/authen_repository_impl.dart';
import 'package:deliveryproyect/src/data/repositories_implementation/food_menu_repos_impl.dart';
import 'package:deliveryproyect/src/data/repositories_implementation/preference_repository_imp.dart';
import 'package:deliveryproyect/src/data/repositories_implementation/websocket_repo_imp.dart';
import 'package:deliveryproyect/src/helpers/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

typedef VoidCallback = void Function();

abstract class DependencyInjection {
  static Future<void> initialize() async {
    final prefs = await SharedPreferences.getInstance();

    final authenticationRepository = AuthenticationRepositoryImpl(
        AuthenticationProvider(), AuthenticationClient(prefs));
    final foodMenuRepository = FoodMenuRepositorImpl(FoodMenuProvider());

    final wsProvider = WebsocketProvider();
    final websocketRepository = WebsocketRepositoryImp(wsProvider);

    final preferenceProvider = PreferenceProvider(prefs);
    final preferenceRepository = PreferenceRepositoryImp(preferenceProvider);

    final autenticationClient = AuthenticationClient(prefs);
    final accountRepository =
        AccountRepositoryImp(AccountProvider(autenticationClient));

    Get.i.put<AuthenticationRepository>(authenticationRepository);
    Get.i.put<FoodMenuRepository>(foodMenuRepository);
    Get.i.put<WebsocketRepository>(websocketRepository);
    Get.i.put<PreferenceRepository>(preferenceRepository);
    Get.i.put<AccountRepository>(accountRepository);

    final VoidCallback dispose = () {
      wsProvider.dispose();
    };
    Get.i.put<VoidCallback>(dispose, tag: "dispose");
  }

  static void dispose() {
    final dispose = Get.i.find<VoidCallback>(tag: "dispose");
    dispose();
  }
}
