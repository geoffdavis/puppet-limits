class limits::config {
    file { $limits::params::limits_dir:
        ensure  => directory,
        owner   => $limits::params::file_owner,
        group   => $limits::parmas::file_group,
        force   => $limits::params::limits_dir_force,
        purge   => $limits::params::limits_dir_purge,
        recurse => $limits::params::limits_dir_recurse,
    }
}
