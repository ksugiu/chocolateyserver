
# chocolateyserver

This is the first release of a puppet module that allow you to easily install a simple Chocolatey.Server on Windows 2012 R2 and 2016 servers.

The installation workflow is 100% based on the setup steps that you can find on the official Chocolatey.Server website (https://chocolatey.org/docs/how-to-set-up-chocolatey-server)



#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with chocolateyserver](#setup)
    * [Setup requirements](#setup-requirements)
    * [Beginning with chocolateyserver](#beginning-with-chocolateyserver)
5. [Limitations - OS compatibility, etc.](#limitations)

## Description

This is the first release of a puppet module that allow you to easilly install a simple Chocolatey.Server on Windows 2012 R2 and 2016 servers with default configurations.


You can provide a listening port with parameter "port". By default, it's 8080.



## Setup


### Setup Requirements

Official Chocolatey.Server requirements :

* 50GB of free space for where ever you will put packages.
* At least 8GB RAM, but more if you can.
* Ability to set up an IIS site and unblock website ports.
* No IIS site for WSUS administration on the same server.
* If you can ensure your server is up to date with all of the Windows Updates, you will move through this process quite a bit quicker.

### Beginning with chocolateyserver

Just call it in your node declaration.

```
include chocolateyserver
```
Default port is 8080.
Or you can specify a special port by declaring chocolateyserver class like :

```
class{ 'chocolateyserver':
    port => 5555,
}
```

## Limitations

This module works only on windows 2012 R2 and Windows 2016.

