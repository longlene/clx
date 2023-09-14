# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

EGIT_COMMIT="03e8a3ab1d4d014e63a2befe8a48e74783a81521"

DESCRIPTION="TOML parser in C"
HOMEPAGE="https://github.com/ajwans/libtoml"
SRC_URI="https://github.com/ajwans/libtoml/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="dev-utils/ragel"
RDEPEND="${DEPEND}"

CMAKE_IN_SOURCE_BUILD="YES"

src_prepare() {
	eapply_user
	sed -e '/ADD_EXECUTABLE(main/,$d' -i CMakeLists.txt || die "prepare failed"
}

src_install() {
	dolib.so libtoml.so
	insinto /usr/include
	doins toml.h
	dodoc README.md
}
