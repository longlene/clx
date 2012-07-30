# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils
DESCRIPTION="Plug-in for The GIMP that stitches individual images together to a panorama."
HOMEPAGE="http://stitchpanorama.sourceforge.net/"
SRC_URI="mirror://sourceforge/stitchpanorama/stitch_${PV}.py"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE="python"

DEPEND=">=media-gfx/gimp-2.2"
RDEPEND=">=dev-python/pygtk-2.0
	>=dev-lang/python-2.3
	>=media-gfx/gimp-2.2"

src_unpack() {
	mkdir -p ${S}
	for F in ${A}; do
		cp ${DISTDIR}/${F} ${S}/
	done
}

pkg_setup() {
	if ! built_with_use gimp python; then
		die "The GIMP must be compiled with the python USE flag!"
	fi
}

src_install() {
	DDIR=${D}/usr/lib/gimp/2.0/plug-ins
	mkdir -p ${DDIR}
	for F in ${A}; do
		cp ${S}/${F} ${DDIR}/
		chmod 755 ${DDIR}/${F}
	done
}
