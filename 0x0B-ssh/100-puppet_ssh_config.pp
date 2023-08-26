# Modify client config file
include stdlib

file_line { 'Declare identity file':
  path    => '/etc/ssh/ssh_config',
  line    => '    IdentifyFile ~/alx-system_engineering-devops/0x0B-ssh/school',
  replace => true,
}

file_line { 'Turn off passwd auth':
  path    => '/etc/ssh/ssh_config',
  line    => '    PasswordAuthentication no',
  replace => true,
}
