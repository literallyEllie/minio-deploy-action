# Minio Deploy GitHub Action

Run [minio client][] in GitHub Actions to deploy files to Minio object storage.

It uses the `mc mirror --overwrite` command to deploy, or `mc cp` on a single file.

## Usage

Put the following step in your workflow:

```yml
- name: Minio Deploy
uses: literallyellie/minio-deploy-action@main
with:
  endpoint: ${{ secrets.MINIO_ENDPOINT }}
  access_key: ${{ secrets.MINIO_ACCESS_KEY }}
  secret_key: ${{ secrets.MINIO_SECRET_KEY }}
  bucket: 'mybucket'
  # Optional inputs with their defaults:
  source_dir: 'public'
  target_dir: '/'
  cp_mode: true 
```

Workflow example:

```yml
name: Deploy

on:
  pull_request:
    types: [opened, synchronize]
  push:
    branches:
      - master

jobs:
  build:
    name: Deploy
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v1

      - name: Minio Deploy
        uses: literallyellie/minio-deploy-action@main
        with:
          endpoint: ${{ secrets.MINIO_ENDPOINT }}
          access_key: ${{ secrets.MINIO_ACCESS_KEY }}
          secret_key: ${{ secrets.MINIO_SECRET_KEY }}
          bucket: 'mybucket'
          source_dir 'public'
          target_dir: '/'
```

## License

Licensed under the MIT license. See [LICENSE](LICENSE).

[minio client]: https://docs.min.io/docs/minio-client-quickstart-guide
