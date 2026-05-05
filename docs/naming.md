# Naming

Use names that make the business domain and environment obvious.

## Object Storage

```text
ngdem-<domain>-<environment>-private
ngdem-<domain>-<environment>-public
```

Examples:

```text
ngdem-finance-stage-private
ngdem-finance-stage-public
ngdem-global-internal-private
ngdem-global-internal-public
```

## Service Accounts

```text
sa-<domain>-<environment>-<purpose>
```

Example:

```text
sa-finance-stage-s3
```

## Lockbox

Use one credentials secret per environment and purpose.

Example secret:

```text
finance-stage-s3-credentials
```

Payload entry keys:

```text
finance-stage/s3/access-key-id
finance-stage/s3/secret-access-key
```
