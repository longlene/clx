# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A Google Protobuf implementation for Erlang"
HOMEPAGE="https://github.com/tomas-abrahamsson/gpb"
SRC_URI="https://github.com/tomas-abrahamsson/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

RDEPEND="
	>=dev-lang/erlang-17.1"
DEPEND="${RDEPEND}"

DOCS=( README.md )

src_prepare() {
	default
	sed -i "s#@vsn@#${PV}#" include/gpb_version.hrl.in
	cp include/gpb_version.hrl.in include/gpb_version.hrl
}

src_install() {
	insinto /usr/lib/erlang/lib/${P}
	doins -r ebin include priv
	exeinto /usr/lib/erlang/lib/${P}/bin
	doexe bin/protoc-erl
	dosym ../lib/erlang/lib/${P}/bin/protoc-erl /usr/bin/protoc-erl
	einstalldocs
}
