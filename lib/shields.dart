import 'dart:io';
import 'dart:math';
import 'package:l_cli/question.dart';
import 'package:tmpl/tmpl.dart';

final template = Template(
  r'''
[![${host}](https://${host}/shield.svg?hash=${hash})](https://${host}?utm_source=${package_name})
[![GitHub stars](https://img.shields.io/github/stars/${github_name}/${package_name}.svg?style=social)](https://github.com/${github_name}/${package_name})
[![Twitter Follow](https://img.shields.io/twitter/follow/${twitter_name}.svg?label=Follow%20me&style=social)](https://twitter.com/${twitter_name})
'''
      .trim(),
);

class ShieldProps {
  final String host;
  final String packageName;
  final String githubName;
  final String twitterName;
  final String hash;

  static Future<ShieldProps> read() async {
    return ShieldProps(
      githubName: Platform.environment['GITHUB_USERNAME'] ??
          await question('GitHub username'),
      host: Platform.environment['SHIELDS_HOST'] ?? await question('Hostname'),
      packageName: await question('Package name'),
      twitterName: Platform.environment['TWITTER_USERNAME'] ??
          await question('Twitter username'),
    );
  }

  ShieldProps({
    this.host,
    this.packageName,
    this.githubName,
    this.twitterName,
    this.hash,
  });
}

String compileShields(ShieldProps props) {
  return template.compile({
    'host': props.host,
    'package_name': props.packageName,
    'github_name': props.githubName,
    'twitter_name': props.twitterName,
    'hash': props.hash ?? Random().nextInt(124568),
  });
}
