# bem-te-vi action

This action is an easier and more reusable way to use the [bem-te-vi](https://github.com/droposhado/bem-te-vi) project.

## Inputs

### `webdav_server`

**Required** Server domain or subdomain url. Default `""`.

### `webdav_username`

**Required** Username used in DAV service. Default `""`.

### `webdav_password`

**Required** Password used in DAV service. Default `""`.
    
### `webdav_addressbook`

**Required** Path representing the address book in the DAV service. Default `""`.

### `webhook_url`

**Required** Slack compatible webhook. Default `""`.

### `date_layout`

**Required** Date parse mask. Default `2006-01-02T15:04:05Z`.

### `bot_name`

**Optional** The name of the bot on chat. Default `Bot defined`.

### `icon_url`

**Optional** Avatar of bot. Default `Bot defined or service default user icon`.

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
