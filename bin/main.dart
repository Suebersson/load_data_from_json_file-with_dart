import 'dart:developer' show log;
import 'package:load_data_from_json_file_with_dart/data_from_json_file/data.dart';

void main() async{

  await Data.load();

  log(
    'Addredd: ${Data.address}',
    name: 'main'
  );
  log(
    'Port: ${Data.port}',
    name: 'main'
  );

}
