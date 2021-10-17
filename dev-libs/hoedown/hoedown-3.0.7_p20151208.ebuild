# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit vcs-snapshot versionator

EGIT_COMMIT="980b9c549b4348d50b683ecee6abee470b98acda"

DESCRIPTION="Standards compliant, fast, secure markdown processing library in C"
HOMEPAGE="https://github.com/hoedown/hoedown"
SRC_URI="https://github.com/hoedown/hoedown/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="static"

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dobin hoedown smartypants
	dolib.so libhoedown.so.$(get_major_version)
	dosym libhoedown.so.$(get_major_version) /usr/$(get_libdir)/libhoedown.so
	use static && dolib.a libhoedown.a
	insinto /usr/include/hoedown
	doins src/*.h
	dodoc README.md
}
