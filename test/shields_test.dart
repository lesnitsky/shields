import 'package:flutter_test/flutter_test.dart';

import 'package:shields/shields.dart';

void main() {
  test('compiles shields correctly', () {
    final props = ShieldProps(
      githubName: 'user',
      host: 'example.com',
      packageName: 'some_package',
      twitterName: 'user',
      hash: '18157',
    );

    final expected =
        r'''[![example.com](https://example.com/shield.svg?hash=18157)](https://example.com?utm_source=some_package)
[![GitHub stars](https://img.shields.io/github/stars/user/some_package.svg?style=social)](https://github.com/user/some_package)
[![Twitter Follow](https://img.shields.io/twitter/follow/user.svg?label=Follow%20me&style=social)](https://twitter.com/user)''';

    final actual = compileShields(props);

    expect(actual, equals(expected));
  });
}
