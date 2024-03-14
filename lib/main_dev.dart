import 'config/flavors.dart';

import 'main.dart' as runner;

Future<void> main() async {
  F.appFalvor = Flavor.dev;
  await runner.main();
}
