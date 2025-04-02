# Copyright 2025 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="A Google Protobuf implementation for Erlang"
HOMEPAGE="https://github.com/tomas-abrahamsson/gpb"
SRC_URI="https://github.com/tomas-abrahamsson/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

RDEPEND=""
DEPEND="${RDEPEND}"

DOCS=( README.md )

src_prepare() {
	default
	sed -i "s#@vsn@#${PV}#" include/gpb_version.hrl.in
	mv include/gpb_version.hrl.in include/gpb_version.hrl
}

src_compile() {
	emake
}

src_install() {
	rebar3_install_lib .
	local dest="$(get_erl_libs)/${P}"
	insinto "${dest}"
	doins -r bin
	dosym "${dest}"/bin/protoc-erl /usr/bin/protoc-erl
	einstalldocs
}
