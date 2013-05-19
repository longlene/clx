# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

MY_P="${P}-0"
DESCRIPTION="Python binding for OGRE 3D engine"
HOMEPAGE="http://www.ogre3d.org/wiki/index.php/PyOgre"
SRC_URI="http://download.berlios.de/pyogre/${MY_P}.zip"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~x86"
IUSE="cegui doc"

DEPEND=">=dev-lang/python-2.4
		>=dev-lang/swig-1.3.25
		>=dev-games/ogre-1.0.6
		cegui? (dev-games/cegui)"

S="${WORKDIR}/${MY_P}"

src_compile() {
	
	if !(use cegui); then
		sed -i -e "s/ext_ogre,\ ext_cegui/ext_ogre/g" \
				${S}/setup.py || die "sed failed"
	fi

	distutils_src_compile
}

src_install() {
	distutils_src_install

	if use doc; then
		insinto /usr/share/doc/${PF}/demos
		doins -r demos/*
	fi

	dodoc AUTHORS ChangeLog COPYING
}
