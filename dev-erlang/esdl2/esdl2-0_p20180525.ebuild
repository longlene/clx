# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="37a28c68e06895ede3cf8a27f4dd4223932ef7f4"

DESCRIPTION="SDL2 Erlang NIF"
HOMEPAGE="https://github.com/ninenines/esdl2"
SRC_URI="https://github.com/ninenines/${PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

RDEPEND="
	>=dev-lang/erlang-17.1"
DEPEND="${RDEPEND}"

src_install() {
	insinto /usr/lib/erlang/lib${P}
	doins -r ebin include priv
	dodoc README.asciidoc
}
