# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="LibYAML binding for Lua"
HOMEPAGE="http://gvvaughan.github.io/lyaml"
SRC_URI="https://github.com/gvvaughan/lyaml/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-libs/libyaml
	dev-lua/ldoc
"

src_compile() {
	lua build-aux/luke || die
}

src_install() {
	lua_install_cmodule linux/yaml.so
	lua_install_module -r lib/lyaml
	dodoc README.md
}
