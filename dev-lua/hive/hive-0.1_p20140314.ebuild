# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit lua vcs-snapshot

EGIT_COMMIT="182afa65149d4d4e58ad16dbe7fa85480f9700e8"

DESCRIPTION="Parallel lua states"
HOMEPAGE="https://github.com/cloudwu/hive"
SRC_URI="https://github.com/cloudwu/hive/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -e 's#hive/core.#core.#' \
		-e 's#lua52#lua#' \
		-i Makefile
}

src_compile() {
	emake posix
}

src_install() {
	lua_install_module hive{,.lua}
	lua_install_cmodule core.so
	dodoc README.md
}
