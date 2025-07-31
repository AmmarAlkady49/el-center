import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'GROK_API_KEY', obfuscate: true)
  static final String grokApiKey = _Env.grokApiKey;
}
