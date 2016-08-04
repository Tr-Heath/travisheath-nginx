#nginx service class
class nginx::service {
  service { 'nginx':
    ensure => running,
    enable => true,
  }
}
