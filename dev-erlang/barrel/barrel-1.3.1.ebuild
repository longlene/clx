# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="Embeddable edge-AI database composing the document and vector layers"
HOMEPAGE="https://github.com/barrel-db/barrel"
SRC_URI="https://repo.hex.pm/tarballs/${PN}-${PV}.tar"
S="${WORKDIR}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RDEPEND="
	>=dev-lang/erlang-26
	>=dev-erlang/barrel-crypto-1.0.0
	>=dev-erlang/barrel-docdb-1.0.0
	>=dev-erlang/barrel-embed-2.3.0
	>=dev-erlang/barrel-vectordb-2.3.0
"

src_unpack() {
	# Hex tarballs wrap the app source in contents.tar.gz.
	unpack "${A}"
	tar -xzf contents.tar.gz || die
}
