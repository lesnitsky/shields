import 'package:l_cli/cli.dart';
import 'package:shields/shields_command.dart';

void main(List<String> args) async {
  final cli = new Cli();
  cli.add(ShieldsCommand()..name = 'main');

  await cli.exec(args);
}
