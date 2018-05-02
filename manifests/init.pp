# Description : This Class is the main class class of chocolateyserver's module.

class chocolateyserver (
    $port = 8080
){
    require chocolatey
    contain chocolateyserver::packages
    contain chocolateyserver::setupweb
    contain chocolateyserver::acl

    Class['::chocolateyserver::packages'] -> Class['::chocolateyserver::setupweb'] -> Class['::chocolateyserver::acl']
}
