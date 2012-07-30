# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="Downtube is an application that downloads YouTube videos."
HOMEPAGE="http://downtube.codigolivre.org.br/"
SRC_URI="http://codigolivre.org.br/frs/download.php/5174/${P}.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=">=net-misc/wget-1.10.2
	  >=dev-lang/python-2.3
	  media-video/mplayer"

pkg_setup(){
	if ! built_with_use media-video/mplayer encode; then
	einfo "this program need mplayer with encode USE flag!"
	die "mplayer without encode use flag."
	fi
}

src_compile(){
	cd ${S}
	python setup.py build
}

src_install(){
	cd ${S}
	python setup.py install --root ${D}

	dodoc AUTHORS ChangeLog FAQ README
}
