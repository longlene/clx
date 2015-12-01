# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit qt4-r2 subversion

DESCRIPTION="Kumir is a simple programming language and IDE"
HOMEPAGE="http://lpm.org.ru/kumir/"
ESVN_REPO_URI="http://lpm.org.ru/svn/kumir/trunk/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="x11-libs/qt-gui:4"
RDEPEND="${DEPEND}"

src_compile () {
	PREFIX="${D}/usr" INSTALL_DIR="${D}/usr/share/${PN}" eqmake4
	emake || die "Cannot run make"
}

src_install() {
	emake install || die "Cannot install"
}
