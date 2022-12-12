Exec {
 path => ['/usr/bin', '/usr/sbin', '/bin', '/usr/local/sbin', '/sbin']
}

$update = 'apt-get update -y'
exec {'apt-update':
 command => $update
}

package { 'nginx':
  require => Exec['apt-update'],
  ensure => installed,
}

service { 'nginx':
  ensure => running,
  require => Package['nginx'],
  enable => true
}

 file{lookup(["/usr/share", "/usr/share/www", "/usr/share/www/html"]):
  ensure => "directory"
 }