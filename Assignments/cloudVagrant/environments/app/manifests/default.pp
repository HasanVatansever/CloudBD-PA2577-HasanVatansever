Exec {
 path => ['/usr/bin', '/usr/sbin', '/bin', '/usr/local/sbin', '/sbin']
}

$update = 'apt-get update -y'
exec {'update':
 command => $update
}
package { 'curl':
 ensure => 'installed'
}

$nodeGetList= 'curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -'
$nodeInstall= 'apt-get install -y nodejs'
exec { 'nodeGetList':
 command => $nodeGetList,
 require => Package['curl'],
}
exec { 'nodeInstall':
 command => $nodeInstall,
 require => Exec['nodeGetList']
}