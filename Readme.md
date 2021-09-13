# CyberArk Repair Utility

A utility for correcting a CyberArk update issue.

## Disclaimer:

This tool is only intended for Lumen clientele impacted by a CyberArk update that is blocking Windows for end-users.

The maintainer of this repository is _not_ responsible for any data lost as a result of using this tool or modifying its source. By downloading and using release builds, you are agreeing to this condition. _"Loss"_ or _"Damage"_ of personal data includes, but is not limited to:

- Lost files
- Corrupt files

**Use this tool at your own risk!**

## Releases

Get the latest release [here](https://github.com/Zach-Galek/CyberArk-Repair-Utility/releases/latest).

## Usage

The first fix will suspend CyberArk on the target machine, only proceed to the second fix if you have already applied the first and the target machine has been rebooted. For either step, simply enter a machine name on your domain and as long as the target has an active VPN connection, the tool will resolve and save it's IPv4 address for use in a given session.

## Features

- Suspends and re-enables CyberArk
- Automatically resolves target IPv4 address

## Todo

- Error Handling

Errors need to be added where applicable.
