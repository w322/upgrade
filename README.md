# upgrade.sh

A simple script to upgrade a Debian based Linux installation.

## Features

* Updates the list of available packages
* Installs available Upgrades
* Runs silenty in the background
* Runs with low system priority so the user is not slowed down
* Removes temporary files
* Logs at a configurable location
* Limits the size of th log

## Getting Started

You can setup crontab to run the script daily.  Edit crontab:

```shell
sudo crotab -e
```
Example to run daily at 04:00;

```shell
0 4 * * * /usr/local/bin/upgrade.sh
```

## License

[GPL v3.](https://opensource.org/licenses/gpl-license)
