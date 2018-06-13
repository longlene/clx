# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils

DESCRIPTION="Gherkin parser/compiler in C"
HOMEPAGE="https://github.com/cucumber/gherkin-c"
SRC_URI="https://github.com/cucumber/gherkin-c/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -e '/target_link_libraries(gherkin/{s#gherkin)#gherkin m)#}' \
		-e "/set(lib_install_dir/{s#lib/#$(get_libdir)/#}" \
		-i CMakeLists.txt || die "prepare failed"
}
