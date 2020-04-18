import 'package:shields/shields.dart';

void main(List<String> args) async {
  final props = await ShieldProps.read();
  print(compileShields(props));
}
