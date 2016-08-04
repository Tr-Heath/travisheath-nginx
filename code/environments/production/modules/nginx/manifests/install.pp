#install class to manage the installation of nginx
class nginx::install {
  contain 'nginx::config'

  #add official nginx repo
  file {"centos repo":
    ensure  =>  file,
    path  =>  "/etc/yum.repos.d/nginx.repo",
    source  =>  "puppet:///modules/nginx/centos_nginx.repo",
  } 
  
  case $::operatingsystem {
    'CentOS': {
      package { 'install nginx':
        ensure => latest,
        name   => "nginx",
        require => File["centos repo"],
      }
    }
    #'RHEL': {
    #  package { 'install nginx':
    #    ensure => latest,
    #    name   => "nginx",
    #    require => File["rhel repo"],
    #  }
    #}
    default: {
      fail("Operating System: ${::operatingsystem} is unsupported by this nginx module.")
    }
  }
}
