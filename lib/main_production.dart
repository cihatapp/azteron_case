import 'package:azteron_case/app/app.dart';
import 'package:azteron_case/bootstrap.dart';

Future<void> main() async {
  await bootstrap(() => const App());
}
