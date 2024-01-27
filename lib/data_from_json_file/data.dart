import 'dart:io' show File, Platform;
import 'dart:developer' show log;
import 'dart:convert' show jsonDecode;

abstract class Data {

  static String get address => 'address'.value;
  static String get port => 'port'.value;

  static final Map<String, dynamic> _data = {};

  static Future<void> load() async {

    final File file = File(
      'lib${Platform.pathSeparator}'
      'data_from_json_file${Platform.pathSeparator}'
      'data.json'
    );

    try {
      if (await file.exists()) {
        await file.readAsString().then((data) {
          _data.addAll(jsonDecode(data.replaceAll('\n', '')));
        });
      } else {
        log(
          'Arquivo não localizado: ${file.path}',
          name: '$Data',
        );
      }
    } catch (e) {
      throw const _Data('Erro desconhecido ao tentar carregar os dados do arquivo [.json], '
        'faça um tratamento para este erro.');
    }

  }

}

extension _GetValue on String {

  String get value => Data._data[this] ?? undefinedValue;

  String get undefinedValue => throw _Data('O valor de [$this] não foi definido');

}

class _Data implements Exception {
  final String message;
  const _Data(this.message);
  @override
  String toString() => message;
}