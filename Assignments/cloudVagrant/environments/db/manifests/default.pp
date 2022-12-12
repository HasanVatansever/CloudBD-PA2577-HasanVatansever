Exec {
 path => ['/usr/bin', '/usr/sbin', '/bin', '/usr/local/sbin', '/sbin']
}

$update = 'apt-get update -y'
exec {'apt-update':
 command => $update
}

package { 'mysql-server':
  require => Exec['apt-update'],
  ensure => installed,
}
service { 'mysql':
  ensure => running,
  require => Package['mysql-server'],
}


 
