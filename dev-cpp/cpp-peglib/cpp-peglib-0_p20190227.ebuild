# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils vcs-snapshot

EGIT_COMMIT="bbeadfa937230d76f536cffc564997de9437842c"

DESCRIPTION="C++ header-only PEG library"
HOMEPAGE="https://github.com/yhirose/cpp-peglib"
SRC_URI="https://github.com/yhirose/cpp-peglib/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include
	doins peglib.h
	dobin ${BUILD_DIR}/lint/peglint
	dodoc README.md
}
