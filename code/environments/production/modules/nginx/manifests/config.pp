#Class for nginx configuration
class nginx::config{

  #update nginx.conf file 
  file {"nginx html config":
    ensure  =>  file,
    path  =>  "/etc/nginx/conf.d/default.conf",
    source  =>  "puppet:///modules/nginx/default.conf",
    require =>  Package["install nginx"],
  }

  user {"nginx-user":
    ensure  =>  present,
    name  =>  "nginx-user",
    uid =>  777,
    gid =>  777,
    shell =>  "/bin/bash",
    home  =>  "/home/nginx-user",
  }

  group {"nginx-user group":
    ensure  =>  present,
    name  =>  "nginx-user",
    gid =>  777,
  } 

  file {"nginx default config":
    ensure  =>  file,
    path  =>  "/etc/nginx/nginx.conf",
    source  =>  "puppet:///modules/nginx/nginx.conf",
    require =>  Package["install nginx"],
  }

  file {"nginx dir":
    ensure  =>  directory,
    path  =>  "/usr/share/nginx",
    owner =>  "nginx-user",
    group =>  "nginx-user",
  }

  file {"site dir":
    ensure  =>  directory,
    path  =>  "/usr/share/nginx/html",
    owner =>  "nginx-user",
    group =>  "nginx-user",
  }

  file {"site content":
    ensure  =>  file,
    path  =>  "/usr/share/nginx/html/index.html",
    source  =>  "https://raw.githubusercontent.com/puppetlabs/exercise-webpage/master/index.html",
    owner =>  "nginx-user",
    group =>  "nginx-user",
  }
}