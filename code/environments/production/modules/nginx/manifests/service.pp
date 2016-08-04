#nginx service class
class nginx::service {
  service { 'nginx':
    ensure => running,
    subscribe =>  File["nginx default config"],
  } 
}
