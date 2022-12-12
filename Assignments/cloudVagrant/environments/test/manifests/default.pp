Exec {
 path => ['/usr/bin', '/usr/sbin', '/bin', '/usr/local/sbin', '/sbin']
}

$update = 'apt-get update -y'
exec {'update':
 command => $update,
  ensure => 'installed'
}