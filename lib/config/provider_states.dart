import 'package:drevol/provider/home_provider.dart';
import 'package:drevol/provider/login_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ProviderState {
  List<SingleChildWidget> providerStateList = [
    // All the change notifiers will be created here.

    ChangeNotifierProvider<LoginProvider>(create: (_) => LoginProvider()),
    ChangeNotifierProvider<HomeScreenProvider>(
        create: (_) => HomeScreenProvider()),
  ];
}
