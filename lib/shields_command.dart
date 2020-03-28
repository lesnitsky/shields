import 'dart:io';

import 'package:guard/guard.dart';
import 'package:l_cli/question.dart';
import 'package:shields/shields.dart';
import 'package:l_cli/command.dart';
import 'package:fs_extensions/fs_extensions.dart';

class ShieldsCommand extends Command {
  ShieldsCommand() : super('shields', 'Generates shields');

  @override
  Future<void> exec(List<String> args) async {
    final path = guard(() => args.first, 'README.md');

    final props = ShieldProps(
      githubName: String.fromEnvironment(
        'GITHUB_USERNAME',
        defaultValue: await question('GitHub username'),
      ),
      host: String.fromEnvironment(
        'SHIELDS_HOST',
        defaultValue: await question('Hostname'),
      ),
      packageName: await question('Package name'),
      twitterName: await question('Twitter name'),
    );

    final f = File(Directory.current.path.joinAll([path]))..createIfNotExists();
    final c = compileShields(props);
    f.append(c);
  }
}
