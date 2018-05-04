# metadata-env-buildkite-plugin

Buildkite plugin to inject buildkite-agent metadata into environment

## Example

```yml
steps:
  - block: "Request Release"
    fields:
      - select: "Select account"
        key: "ROLE_ARN"
        options:
          - label: "Production"
            value: "arn:aws:iam::123456789:role/production-role"
          - label: "Staging"
            value: "arn:aws:iam::987654321:role/staging-role"
  - command: echo $ROLE_ARN
    plugins:
      ACloudGuru/metadata-env:
        - ROLE_ARN
```