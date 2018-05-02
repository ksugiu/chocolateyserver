
# Description : This class install all needed packages for Chocolatey.Server

class chocolateyserver::packages {

  package { 'KB2919355':
    ensure   => 'present',
    provider => chocolatey
  }

  package { 'KB2919442':
    ensure   => 'present',
    require  => Package['KB2919355'],
    provider => chocolatey
  }

  package { 'dotnet4.6.1':
    ensure   => 'present',
    require  => Package['KB2919442'],
    provider => chocolatey
  }

  package { 'chocolatey.server':
    ensure   => 'present',
    require  => Package['dotnet4.6.1'],
    provider => chocolatey
  }

  package { 'IIS-WebServer':
    ensure   => 'present',
    source   => 'windowsfeatures',
    require  => Package['chocolatey.server'],
    provider => chocolatey
  }

  package { 'IIS-ASPNET45':
    ensure   => 'present',
    source   => 'windowsfeatures',
    require  => Package['IIS-WebServer'],
    provider => chocolatey
  }

}
