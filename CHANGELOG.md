# CHANGELOG

## Unreleased

## 1.0.3 - 2017.04.24

- Preserve Platform section in Gemfile.lock [#4](https://github.com/jollygoodcode/lockfile_preserver/pull/4)

## 1.0.2 - 2016.06.14

- Fix `LockfilePreserver::RubyVersion` does not add `RUBY VERSION` section back to lockfile bug [#3](https://github.com/jollygoodcode/lockfile_preserver/pull/3)

## 1.0.1 - 2016.06.02

- Introduce `LockfilePreserver::RubyVersion` [#2][pr2]
- Introduce `LockfilePreserver::Pipeline` [#2][pr2]
- Refactor spec fixture originations [#2][pr2]
- `.keep` now accepts `:ruby_version` to preserve Ruby Version section from the lockfile [#2][pr2]
- new `.keep_all` method to preserve BUNDLED WITH and RUBY VERSION section from the lockfile [#2][pr2]

[pr2]: https://github.com/jollygoodcode/lockfile_preserver/pull/2

## 1.0.0 - 2016.03.08

Init LockfilePreserver.
