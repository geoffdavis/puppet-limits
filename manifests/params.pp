class limits::params {
  case $::osfamily {
    'Debian': {
      $limits_dir_purge = true
      $limits_dir_force = true
      $limits_dir_recurse = true
    }
    'RedHat' : {
      $limits_dir_purge = undef
      $limits_dir_force = undef
      $limits_dir_recurse = undef
    }
    default : {
      fail("Unsupported OS Family $::osfamily")
    }
  }

  $limits_dir = $::osfamily ? {
    default => '/etc/security/limits.d'
  }

  $file_owner = $::osfamily ? {
    default => 'root',
  }

  $file_group = $::osfamily ? {
    default => 'root',
  }

  $valid_limit_types = [
    'core',
    'data',
    'fsize',
    'memlock',
    'nofile',
    'rss',
    'stack',
    'cpu',
    'nproc',
    'as',
    'maxlogins',
    'maxsyslogins',
    'priority',
    'locks',
    'sigpending',
    'msgqueue',
    'nice',
    'rtprio',
  ]

}
