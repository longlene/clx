# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="a Small, Free and Fast Subset of OpenGL"
HOMEPAGE="https://bellard.org/TinyGL/"
SRC_URI="https://bellard.org/TinyGL/TinyGL-${PV}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	x11-libs/libX11
	x11-libs/libXext
"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/TinyGL

src_install() {
	dolib.a lib/libTinyGL.a
	insinto /usr
	doins -r include
	einstalldocs
}
