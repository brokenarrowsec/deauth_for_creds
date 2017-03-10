# deauth_for_creds
Killing a victim's connection to an open AP, in order to steal their credentials.
## Introduction
Inspired by projects like [Fluxion](https://github.com/wi-fi-analyzer/fluxion), "death_for_creds" steals a victim's credentials by deauthenticating them from their actual network, creating a fake access point, and setting up a landing page that requires their credentials, to log into the network. Once they "log in" or "create an account," the deauthentication attack will be killed, assuring that the victim is reconnected to their original access point.
