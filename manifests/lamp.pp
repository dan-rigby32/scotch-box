
class utilities {

  file { "/etc/localtime":
    require => Package["tzdata"],
    source => "file:///usr/share/zoneinfo/US/Mountain",
  }
}
class httpd {

  file { "/etc/apache2/sites-available/scotchbox.local.conf":
    owner   => "root",
    group   => "root",
    mode    => 644,
    replace => true,
    ensure  => present,
    source  => "/vagrant/files/vhosts.conf"
  }
}

include utilities
include httpd