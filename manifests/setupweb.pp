# Description : This class is used for configuring a IIS Website to host Chocolatey Server on Windows.

class chocolateyserver::setupweb inherits ::chocolateyserver {

    iis_site { 'Default Web Site':
      ensure          => 'absent',
      applicationpool => 'DefaultAppPool',
      before          => Iis_application_pool['Chocolatey.Server']
    }

    iis_application_pool { 'Chocolatey.Server':
      ensure                    => 'present',
      state                     => 'started',
      managed_pipeline_mode     => 'Integrated',
      managed_runtime_version   => 'v4.0',
      enable32_bit_app_on_win64 => true
    }

    iis_site { 'Chocolatey.Server':
      ensure           => 'started',
      physicalpath     => 'C:\\tools\\chocolatey.server',
      applicationpool  => 'Chocolatey.Server',
      enabledprotocols => 'http',
      bindings         => [
        {
          'bindinginformation' => "*:${::chocolateyserver::port}:",
          'protocol'           => 'http',
    },
      ],
              require  => Iis_application_pool['Chocolatey.Server'],
}


}
