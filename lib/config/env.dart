import 'package:flutter_dotenv/flutter_dotenv.dart';

String devUrl = dotenv.env['DEV_URL']!;
String prodUrl = dotenv.env['PROD_URL']!;