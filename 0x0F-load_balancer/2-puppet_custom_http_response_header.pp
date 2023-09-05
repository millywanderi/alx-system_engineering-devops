# Installs a Nginx server with custom HTTP header

exec { 'apt-pdate':
  command => '/usr/bin/apt-get -y update',
  path    => ['/usr/bin', '/bin'],
}
package { 'nginx':
  ensure => installed,
}
file { '/var/www/html/index.html':
  content => 'Hello World!',
}
file_line { 'add custom header':
  ensure => present,
  path   => 'etc/nginx/sites-available/default',
  line   => "\tadd_header X-Served-By ${hostname];",
  after  => 'server_name_;',
}
service { 'nginx':
  ensure => running,
}
