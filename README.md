# Gilded Rose Refactoring Kata

Originally created and maintained by @emilybache. Adapted from [emilybache/GildedRose-Refactoring-Kata](https://github.com/emilybache/GildedRose-Refactoring-Kata) by @ksmutny.

# Installation

## Install [utPLSQL](https://github.com/utPLSQL/utPLSQL)

1. Download the [latest release](https://github.com/utPLSQL/utPLSQL/releases) from GitHub.
2. Run installation script:

```
sqlplus sys/<password>@localhost:1521/FREEPDB1 as sysdba @install_headless.sql
```

Note: When running from **PowerShell**, do not forget to add `` ` `` escape character before `@`.

To customize the installation, follow the official [installation guide](https://github.com/utPLSQL/utPLSQL/blob/develop/docs/userguide/install.md).

## Create `dojo` schema

Create `dojo` user using `create_user_dojo.sql` script.

Run the following scripts to install the "production" code:

- `item.sql`
- `new_item.sql`
- `update_quality.sql`

Create test packages:

- `text_test`
- `ut_update_quality`

Run tests by `run_tests.sql` script.

Note: Tested on Oracle 23c Free using the official [Docker image](https://container-registry.oracle.com/ords/f?p=113:10:116223715701859:::::).
