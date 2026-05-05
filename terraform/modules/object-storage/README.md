# Object Storage Module

Creates one environment-level Object Storage pair:

- private bucket;
- public bucket;
- S3 service account;
- static S3 access key;
- Lockbox secret with the generated credentials.

The public bucket enables anonymous object read only. Listing and anonymous config reads stay disabled.

The S3 service account receives bucket-level access only for the two buckets created by this module.
