# shields

[![lesnitsky.dev](https://lesnitsky.dev/shield.svg?hash=28148)](https://lesnitsky.dev?utm_source=shields)
[![GitHub stars](https://img.shields.io/github/stars/lesnitsky/shields.svg?style=social)](https://github.com/lesnitsky/shields)
[![Twitter Follow](https://img.shields.io/twitter/follow/lesnitsky_dev.svg?label=Follow%20me&style=social)](https://twitter.com/lesnitsky_dev)

Generates shields to be added to your readme

## Installation

pubspec.yaml:

```yaml
dependencies:
  shields: ^1.0.3
```

or

```sh
pub global activate shields
```

## Example

```dart
import 'package:shields/shields.dart';

void main(List<String> args) async {
  final props = await ShieldProps.read();
  print(compileShields(props));
}

```

from terminal

```sh
shields
```

## Env config

To avoid shields command querying you each time, export this variables

```
export GITHUB_USERNAME=<ghusername>
export SHIELDS_HOST=<yoursite.com>
export TWITTER_USERNAME=<yourtwitterhandle>
```

## License

MIT
