# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils

DESCRIPTION="Cross-platform user-friendly xlsx library for C++14"
HOMEPAGE="https://github.com/tfussell/xlnt"
SRC_URI="https://github.com/tfussell/xlnt/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -i "/set(LIB_DEST_DIR/{s#lib#$(get_libdir)#}" source/CMakeLists.txt
}
