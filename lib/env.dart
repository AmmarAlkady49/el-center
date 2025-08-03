import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'GROK_API_KEY', obfuscate: true)
  static final String grokApiKey = _Env.grokApiKey;
  @EnviedField(varName: 'GROQ_API_KEY3', obfuscate: true)
  static final String groqApiKey3 = _Env.groqApiKey3;
  @EnviedField(varName: 'ASSEMBLY_AI_API_KEY3', obfuscate: true)
  static final String assemblyAiApiKey3 = _Env.assemblyAiApiKey3;
}
