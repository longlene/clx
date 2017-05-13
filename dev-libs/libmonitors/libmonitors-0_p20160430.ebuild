# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils vcs-snapshot

EGIT_COMMIT="82c1301e7e2195ca7d0e86cd700e91b84c1c8ad7"

DESCRIPTION="Cross-platform monitor info and management utility library"
HOMEPAGE="https://github.com/Shirakumo/libmonitors"
SRC_URI="https://github.com/Shirakumo/libmonitors/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Artistic-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	x11-libs/libXrandr
"
RDEPEND="${DEPEND}"

src_install() {
	cmake-utils_src_install
	insinto /usr/include
	doins src/{monitors,export}.h
}
