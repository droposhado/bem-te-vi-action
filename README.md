# bem-te-vi action

This action is an easier and more reusable way to use the [bem-te-vi](https://github.com/droposhado/bem-te-vi) project.

## Inputs

See [action.yml](action.yml)

## Example usage

Uses secrets as arguments to run the action and checks every day at 03:00 UTC. Enabling manual execution with `workflow_dispatch`.

**Warning**: values not stored as secrets are visible in the action log.

```yaml
name: Daily
on:
  schedule:
    - cron: '00 03 * * *'

  workflow_dispatch:

jobs:

  check:
    runs-on: ubuntu-latest

    steps:

      - name: checkout repo
        uses: actions/checkout@v3

      - uses: droposhado/bem-te-vi-action@main
        with:
          webdav_server: ${{ secrets.WEBDAV_SERVER }}
          webdav_username: ${{ secrets.WEBDAV_USERNAME }}
          webdav_password: ${{ secrets.WEBDAV_PASSWORD }}
          webdav_addressbook: ${{ secrets.WEBDAV_ADRESSBOOK }}
          webhook_url: ${{ secrets.WEBHOOK_URL }}
          date_layout: ${{ secrets.DATE_LAYOUT }}
          bot_name: ${{ secrets.BOT_NAME }}
          icon_url: ${{ secrets.ICON_URL }}
```

## License

See [LICENSE](LICENSE.md)
