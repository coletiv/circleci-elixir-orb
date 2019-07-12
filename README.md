# Elixir Orb ![CircleCI status](https://circleci.com/gh/coletiv/circleci-elixir-orb.svg "CircleCI status") [![CircleCI Orb Version](https://img.shields.io/badge/endpoint.svg?url=https://badges.circleci.io/orb/coletiv/elixir)](https://circleci.com/orbs/registry/orb/coletiv/elixir)

Easily integrate custom [Elixir](https://elixir-lang.org) builds and deploys into your [CircleCI](https://circleci.com/ "CircleCI") projects. You can visit this Orb on CircleCI Orbs repository [here](https://circleci.com/orbs/registry/orb/coletiv/elixir).

Learn more about [Orbs](https://github.com/CircleCI-Public/config-preview-sdk/blob/master/docs/using-orbs.md "orb").

## Usage

Example configs:

- [Example 1](src/examples/build-test-deploy.yml) - Build, test and deploy using [edeliver](https://github.com/edeliver/edeliver).
- [Example 2](src/examples/build-test-with-fakes3.yml) - Build and test with FakeS3.
- [Example 3](src/examples/build-test-minimal.yml) - Build and test with `build-and-test` job.

## Repo Maintainers

If `dev:alpha` expires, please create a new version using the following commands:

```
circleci config pack src/ > packed/orb.yml
circleci orb validate packed/orb.yml                              
circleci orb publish packed/orb.yml coletiv/elixir@dev:alpha
```
