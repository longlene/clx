# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

MY_PV="${PN}-${PV}"

DESCRIPTION="MySQL hot backup software."
HOMEPAGE="http://www.percona.com/software/percona-xtrabackup/"
SRC_URI="http://www.percona.com/redir/downloads/XtraBackup/XtraBackup-${PV}/source/${MY_PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="mysql50 mysql51 mysql51plugin +mysql55 mysql56 percona51 percona55"

DEPEND="dev-util/cmake
	dev-libs/libaio
	mysql50? ( sys-devel/automake:1.10 )
	mysql51? ( sys-devel/automake:1.10 )
	mysql51plugin? ( sys-devel/automake:1.10 )
	percona51? ( sys-devel/automake:1.10 dev-vcs/bzr )
	percona55? ( dev-vcs/bzr )"

S="${WORKDIR}/${MY_PV}"

pkg_setup() {
  if ! ( use mysql50 || use mysql51 || use mysql51plugin || use mysql55 || use mysql56 || use percona51 || use percona55 ); then
    die "Please select a target!"
  fi

  einfo;einfo
  ewarn "Warning: please select a single target!"
  einfo
  einfo "mysql50 - MySQL 5.0"
  einfo "mysql51 - built-in InnoDB in MySQL 5.1"
  einfo "mysql51plugin - InnoDB plugin in MySQL 5.1"
  einfo "mysql55 - InnoDB in MySQL 5.5"
  einfo "mysql56 - InnoDB in MySQL 5.6, MariaDB 10.0"
  einfo "percona51 - Percona Server with XtraDB 5.1, MariaDB 5.1, MariaDB 5.2, MariaDB 5.3"
  einfo "percona55 - Percona Server with XtraDB 5.5"
  einfo;einfo
  sleep 10
}

src_compile() {
  if use mysql50; then
	AUTO_DOWNLOAD="yes" ${S}/utils/build.sh innodb50
  fi
  
  if use mysql51; then
	AUTO_DOWNLOAD="yes" ${S}/utils/build.sh innodb51_builtin
  fi
  
  if use mysql51plugin; then
	AUTO_DOWNLOAD="yes" ${S}/utils/build.sh innodb51
  fi

  if use mysql55; then
	AUTO_DOWNLOAD="yes" ${S}/utils/build.sh innodb55
  fi
  
  if use mysql56; then
	AUTO_DOWNLOAD="yes" ${S}/utils/build.sh innodb56
  fi
  
  if use percona51; then
	AUTO_DOWNLOAD="yes" ${S}/utils/build.sh xtradb51
  fi
  
  if use percona55; then
	AUTO_DOWNLOAD="yes" ${S}/utils/build.sh xtradb55
  fi

}

src_install() {	
	dobin innobackupex
	
	if use mysql50; then
	  dobin src/xtrabackup_51
	fi
	
	if use mysql51; then
	  dobin src/xtrabackup_51
	fi
	
	if use mysql51plugin; then
	  dobin src/xtrabackup_plugin
	fi
	
	if use mysql55; then
	  dobin src/xtrabackup_innodb55
	fi
	
	if use mysql56; then
	  dobin src/xtrabackup_56
	fi
	
	if use percona51; then
	  dobin src/xtrabackup
	fi
	
	if use percona55; then
	  dobin src/xtrabackup_55
	fi
	
	doman doc/xtrabackup.1
}

pkg_postinst() {
	elog "Percona xtrabackup installed. Use the following binaries:"
	elog "for MySQL 5.0: xtrabackup_51" 
	elog "for MySQL 5.1 (builtin): xtrabackup_51" 
	elog "for MySQL 5.1 (plugin): xtrabackup_plugin"
	elog "for MySQL 5.5: xtrabackup_innodb55" 
	elog "for MySQL 5.6/MariaDB 10: xtrabackup_56"
	elog "for Percona XtraDB 5.1/MariaDB 5.1/MariaDB 5.2/MariaDB 5.3: xtrabackup" 
	elog "for Percona XtraDB 5.5: xtrabackup_55" 
}
