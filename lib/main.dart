import 'package:myorder_test/screen/home/home_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'config/app_import.dart';
import 'config/config_env.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  AppEnvironment.setupEnv(Environment.prod);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
