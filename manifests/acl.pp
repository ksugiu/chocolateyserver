# Description : This class is used for add rights on "chocolatey.server" and "App_data" 
#               of chocolatey.server installation files. 

class chocolateyserver::acl {

  acl { 'C:\\tools\\chocolatey.server':
    permissions => [
      { identity => 'IIS_IUSRS', rights => ['read'] },
      { identity => 'IUSR', rights => ['read'] },
      { identity => 'IIS APPPOOL\\Chocolatey.Server', rights => ['read'] }
      ]
  }
  acl { 'C:\\tools\\chocolatey.server\\App_Data':
    permissions => [
      { identity => 'IIS_IUSRS', rights => ['modify'] },
      { identity => 'IIS APPPOOL\\Chocolatey.Server', rights => ['modify'] }
      ]
  }
}
