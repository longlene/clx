# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit vcs-snapshot

EGIT_COMMIT="275d1dd39087a18b4e250ecc850fc1cb0f8dd767"

DESCRIPTION="Erlang on the fly module patcher"
HOMEPAGE="https://github.com/ruanpienaar/epatch"
SRC_URI="https://github.com/ruanpienaar/epatch/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -i 's#-pa ebin -pa _build/default/lib/\*/ebin##' rebar.config
}

src_compile() {
	rebar3 escriptize
}

src_install() {
	dobin _build/default/bin/epatch
	dodoc README.md
}
