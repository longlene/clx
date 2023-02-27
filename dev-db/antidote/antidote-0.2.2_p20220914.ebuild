# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit vcs-snapshot

EGIT_COMMIT="1482b81515e894dc4c81997b2c183cc36db63f0f"

DESCRIPTION="A planet scale, highly available, transactional database"
HOMEPAGE="https://www.antidotedb.eu"
SRC_URI="https://github.com/AntidoteDB/antidote/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

RESTRICT=network-sandbox

src_compile() {
	rebar3 release
}

src_install() {
	insinto /usr/lib
	doins -r _build/default/rel/antidote
	dosym ../lib/antidote/bin/antidote /usr/bin/antidote
	dodoc README.md
}
