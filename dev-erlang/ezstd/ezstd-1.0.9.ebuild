# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

ZSTD_PV="1.5.5"

DESCRIPTION="Zstd binding for Erlang"
HOMEPAGE="https://github.com/silviucpp/ezstd"
SRC_URI="
	https://github.com/silviucpp/ezstd/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/facebook/zstd/archive/refs/tags/v${ZSTD_PV}.tar.gz -> zstd-${ZSTD_PV}.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	mkdir -p "${S}"/_build/deps
	ln -sv "${WORKDIR}"/zstd-${ZSTD_PV} "${S}"/_build/deps/zstd
	sed -e '/git checkout/d' \
		-i build_deps.sh
	rebar_src_prepare
}
