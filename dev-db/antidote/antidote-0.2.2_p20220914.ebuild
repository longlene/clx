# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3 vcs-snapshot

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

src_prepare() {
	default
	rebar_remove_deps
	erebar3 get-deps
	sed -e 's#-s init stop##' \
		-e 's#.")#." -s init stop)#' \
		-i _build/default/lib/prometheus_process_collector/c_src/Makefile
}

src_install() {
	insinto /usr/lib
	doins -r _build/default/rel/antidote
	dosym ../lib/antidote/bin/antidote /usr/bin/antidote
	dodoc README.md
}
