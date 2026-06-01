# Copyright 1999-2004 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

ESVN_REPO_URI="svn://svn.berlios.de/irate/trunk/irate"
inherit subversion

MY_P="irate"
DESCRIPTION="iRATE radio is a collaborative filtering system for music. You rate the"
DESCRIPTION_FR="T闁橀枏hargement de musique gratuite suivant vos gouts  (Version SVN)"

HOMEPAGE="http://irate.sf.net"
SLOT="0"
LICENSE="GPL-2"
S="${WORKDIR}/irate"
KEYWORDS="~amd64 ~x86"

DEPEND="sys-devel/gcc
	sys-apps/which"

pkg_setup () {
	if [ -z "$(which gcj 2>/dev/null)" ]
	then
	eerror "It seems that your system doesn't provides a Java compiler."
	eerror "Re-emerge sys-devel/gcc with \"java\" and \"gcj\" enabled. "
	die "gcj not found"
	fi
}

src_compile() {
	# little bug in the Makefile right now (12/09/2004)
	sed -i 's:2135:2136:' Makefile
	make || die
}

src_install () {
	make install DESTDIR=${D}
}
