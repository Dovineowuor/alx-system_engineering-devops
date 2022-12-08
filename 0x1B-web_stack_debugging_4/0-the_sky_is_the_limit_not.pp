# Set the Nginx ULIMIT to a higher value

exec { 'replace ULIMIT':
    path    => '/usr/bin',
    command => 'sudo sed -i "s/ULIMIT=\"-n 15\"/ULIMIT=\"-n 262144\"/g" /etc/default/nginx',
}# 0. Sky is the limit, let's bring that limit higher

service { 'nginx':
  ensure => 'running',
  enable => true,
}

file { '/etc/default/nginx':
  ensure => present,
} -> exec { 'ULIMIT':
  notify  => Service['nginx'],
  path    => '/bin/',
  command => "sed -i 's/15/4096/g' /etc/default/nginx"
}

-> exec { 'restart NGINX':
    path    => '/usr/bin',
    command => 'service nginx restart',
}