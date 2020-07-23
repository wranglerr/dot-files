#!/bin/sh

# power management
configure_services() {
  doas rcctl enable apmd
  doas rcctl start apmd
}

# System setup
install_sys_packages() {
  doas pkg_add colorls
  doas pkg_add fzf ripgrep
  doas pkg_add gmake
}

ready_source_directories() {
  user mod -G wsrc levi
  cd /usr
  mkdir -p xenocara ports
  chgrp wsrc xenocara ports
  chmod 775 xenocara ports
}

fetch_current() {
  cd /usr
  cvs -qd anoncvs@anoncvs.ca.openbsd.org:/cvs checkout -P src
}

update_current() {
  cd /usr/src
  cvs -q up -Pd -A
}

# Ports
# https://www.openbsd.org/faq/ports/ports.html
install_ports_currents() {
  cd /usr
  cvs -qd anoncvs@anoncvs.ca.openbsd.org:/cvs checkout -P ports
  doas pkg_add portslist
}


# Python dev
install_python_dev() {
  doas pkg_add py3-pip
}

# Web dev
install_web_dev() {
}

install_postgresql() {
  doas pkg_add postgresql-server
  cd /var/postgresql
  su _postgresql
  initdb -D /var/postgresql/data/ -U postgres --auth=md5 --pwprompt --encoding=UTF-8 --locale=en_US.UTF-8
  doas rcctl enable postgresql
  doas rcctl start postgresql
}

install_redis() {
  doas pkg_add redis
  doas rcctl enable redis
  doas rcctl start redis
}


install_devops() {
  # Requires ports to be installed to install kubectl
  doas pkg_add google-cloud-sdk

  # install kubectl
  cd /usr/ports/sysutils/kubectl
  make install

  gcloud init
}

run_all() {
  configure_services()
  install_sys_packages()
  install_ports()
  install_python_dev()
  install_postgresql()
  install_web_dev()
  install_devops()
}
