# Copyright 1999-2004 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
# Nonofficial ebuild by Ycarus. For new version look here : http://gentoo.zugaina.org/
# Thanks to Mark Byers for an other search technique for gjc

ESVN_REPO_URI="svn://svn.berlios.de/irate/trunk/irate"
inherit subversion eutils

IUSE=""

MY_P="irate"
DESCRIPTION="iRATE radio is a collaborative filtering system for music. You rate the tracks it downloads and the server uses your ratings and other people's to guess what you'll like. (SVN version)"
DESCRIPTION_FR="Téléchargement de musique gratuite suivant vos gouts  (Version SVN)"

HOMEPAGE="http://irate.sf.net"
SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~x86 ~amd64"
S="${WORKDIR}/irate"

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
