define limits::limits (
  $ensure = present,
  $user = '*',
  $limit_type = undef,
  $hard = undef,
  $soft = undef
) {

  include limits
  include stdlib

  if $hard == undef and $soft == undef {
    fail ("a hard and/or soft limit must be defined")
  }

  if ( $hard != '' and ! is_integer($hard) ) {
    fail ("the value for the hard limit must be an integer")
  }

  if ( $soft != '' and ! is_integer($soft) ) {
    fail ("the value for the soft limit must be an integer")
  }

  validate_re( $user, [ '*', '%', '(@|%)?([a-zA-Z0-9]|-\+)+' ] )
  validate_re( $limit_type, $limits::params::valid_limit_types )

  file { "${limits::params::limits_dir}${name}":
    ensure  => $ensure,
    owner   => $limits::params::file_owner,
    group   => $limits::parmas::file_group,
    content => template('limits/limits.erb'),
  }
}
