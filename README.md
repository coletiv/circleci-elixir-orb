# Elixir Orb

Easily integrate custom [Elixir](https://elixir-lang.org) builds and deploys into your [CircleCI](https://circleci.com/ "CircleCI") projects. 

Learn more about [Orbs](https://github.com/CircleCI-Public/config-preview-sdk/blob/master/docs/using-orbs.md "orb").

## Usage

Example config:

```yaml
version: 2.1
orbs:
  elixir: coletiv/elixir@1.0.0
jobs:
  build-and-test:
    executor: default
    steps:
      - elixir/build

      # FUTURE: This only need to run if the job is a PULL REQUEST, but the feature isn't available yet
      # https://discuss.circleci.com/t/use-environment-variables-in-parameters/26314/5
      - elixir/check-format
      - elixir/coveralls
      - elixir/credo
      - elixir/dialyzer

  deploy-dev:
    executor: default
    steps:
      # Support multiple env deploy
      - elixir/setup_deploy:
          ip: '10.0.23.45'
          encrypted_ssh_private_key_file_path: .encrypted/dev_private_key.pem
          config_file_path: .deliver/dev_config

      - elixir/deploy:
          branch: develop

      - elixir/appsignal-send-marker:
          api_key: f41a1e0d-f4fb-46e6-8518-3b326d06e419
          name: MyApp
          env: dev

  deploy-prod:
    executor: default
    steps:
      - elixir/setup_deploy:
          ip: '10.0.23.45'
          encrypted_ssh_private_key_file_path: '.encrypted/dev_private_key.pem'
          config_file_path: '.deliver/dev_config'

      - elixir/deploy:
          branch: master

      - elixir/appsignal-send-marker:
          api_key: f41a1e0d-f4fb-46e6-8518-3b326d06e419
          name: MyApp
          env: prod

workflows:
  elixir-build-deploy-example:
    jobs:
      - build-and-test:
          filters:
            branches:
              ignore:
                - master
                - develop

      - deploy-dev:
          requires:
            - build-and-test
          filters:
            branches:
              only:
                - develop

      - deploy-prod:
          required:
            - build-and-test
          filters:
            branches:
              only:
                - master
```

`elixir@1.0.0` from the `coletiv` namespace is imported into the config.yml as `elixir` and can then be referenced as such in any job or workflow.
