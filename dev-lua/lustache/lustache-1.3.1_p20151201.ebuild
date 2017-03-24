# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit lua vcs-snapshot

EGIT_COMMIT="c2e7573a1d19e93f5498143d95d9fa705ee512fd"

DESCRIPTION="Mustache templates for Lua"
HOMEPAGE="https://github.com/Olivine-Labs/lustache"
SRC_URI="https://github.com/Olivine-Labs/lustache/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	lua_install_module -r src/lustache{,.lua}
	dodoc README.md
}
