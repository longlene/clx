# Copyright 2005 Pascal Fleury
# Distributed under the terms of the GNU General Public License, v2 or later
# Maintainer: Pascal Fleury <fleury@users.sourceforge.net>
# $Header:$

DESCRIPTION="Unix / Windows Socket programming made easy."
SRC_URI="http://www.alhem.net/Sockets/Sockets-${PV}.tar.gz"
HOMEPAGE="http://www.alhem.net/Sockets"
LICENSE="GPL-2"
SLOT=0

IUSE="doc ssl"
DEPEND="ssl? ( >=dev-libs/openssl-0.9.7e )"
RDEPEND="ssl? ( >=dev-libs/openssl-0.9.7e )
         >=sys-fs/e2fsprogs-1.35-r1"

KEYWORDS="~x86 ~amd64"

S=${WORKDIR}/Sockets-${PV}

src_compile() {
	emake || die
	use doc && ( doxygen -g doxygen.cfg && doxygen doxygen.cfg )
}

src_install () {
	# This is because the installer does not use the proper pathing
	# so when the bin dir is empty, the Socket-config is named 'bin'
	dodir -p /usr/bin

	emake \
		PREFIX=${D}/usr \
		mandir=${D}/usr/share/man \
		infodir=${D}/usr/share/info \
		install || die


	use doc && dodoc html/*
}
