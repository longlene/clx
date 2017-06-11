# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils vcs-snapshot

EGIT_COMMIT="53c300749941a5e0b53cd0b3924bedacd931928f"

DESCRIPTION="A low-level audio mixer pipeline library"
HOMEPAGE="https://github.com/Shirakumo/libmixed"
SRC_URI="https://github.com/Shirakumo/libmixed/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Artistic-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	media-sound/mpg123
"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -i "/install/{s#/usr/local/lib#/usr/$(get_libdir)#}" CMakeLists.txt
}
	
src_install() {
	cmake-utils_src_install
	insinto /usr/include
	doins src/{encoding,mixed}.h
}
