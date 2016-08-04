# Class: nginx
# ===========================
#
# Sample class to install and initially configure an nginx server
#
class nginx {
  contain 'nginx::install'

  #make sure the service is running and subscribed to any changes
  service {"nginx":
    ensure  =>  running,
    subscribe =>  File["nginx default config"],
  }  
}
