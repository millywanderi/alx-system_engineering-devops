# Installs a Nginx server with custom HTTP header

exec {'update':
  command => '/usr/binapt-get update',
}
-> package {'nginx':
  ensure => 'present',
}
-> file_line { 'http_header':
  path => '/etc/nginx/nginx.conf',
  line => "http {\n\tadd_header X-Served-By \"${hostname}\";",
  match => 'http' {',
  }
}
-> exec {'start':
  command => '/usr/bin/service nginx start',
}
