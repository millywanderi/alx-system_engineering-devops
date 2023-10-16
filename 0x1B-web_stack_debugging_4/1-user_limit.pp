# Increase the hard limit for holberton user
exec { 'increase hardlimit':
  command => 'sed -i "/^holberton hard/s/5/100000/" /etc/security/limits.conf',
  path    => '/usr/local/bin/:/bin/'
}
exec { 'increase softlimit':
  command => 'sed -i "/^holberton soft/s/4/100000/" /etc/security/limits.conf',
  path    => '/usr/local/bin/:/bin/'
}
