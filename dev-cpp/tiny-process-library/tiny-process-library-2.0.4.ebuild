# Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake vcs-snapshot

DESCRIPTION="A small platform independent library making it simple to create and stop new processes in C++"
HOMEPAGE="https://gitlab.com/eidheim/tiny-process-library/"
SRC_URI="https://gitlab.com/eidheim/tiny-process-library/-/archive/v2.0.4/tiny-process-library-v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	default
	sed -e "/DESTINATION/{s#lib#$(get_libdir)#}" \
		-i CMakeLists.txt
	cmake_src_prepare
}
