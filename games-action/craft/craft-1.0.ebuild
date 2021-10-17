# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit cmake

DESCRIPTION="A simple Minecraft clone written in C using modern OpenGL"
HOMEPAGE="http://www.michaelfogleman.com/craft/"
SRC_URI="https://github.com/fogleman/Craft/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	net-misc/curl[ssl]
"
RDEPEND="${DEPEND}"

S="${WORKDIR}"/Craft-${PV}

src_install() {
	dobin ${BUILD_DIR}/craft
	dodoc README.md
}
