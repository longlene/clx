# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Syntax checker for Erlang"
HOMEPAGE="https://github.com/ten0s/syntaxerl"
SRC_URI="https://github.com/ten0s/syntaxerl/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-lang/erlang
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dobin _build/default/bin/syntaxerl
	dodoc README.md
}
