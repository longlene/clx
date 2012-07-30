# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

DESCRIPTION="Simple metronome with an easy to use GTK interface"
HOMEPAGE="http://das.nasophon.de"
SRC_URI="${HOMEPAGE}/download/${PN}-${PV}.tar.gz"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"

DEPEND=">=media-sound/klick-0.11.0
        >=dev-python/pyliblo-0.7.0
        >=dev-lang/python-2.5"

DOCS="COPYING NEWS README"

src_compile() {
    distutils_src_compile
}

src_install() {
    distutils_src_install
}
