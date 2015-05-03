# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit multilib git-2

DESCRIPTION="Lua in Erlang"
HOMEPAGE="https://github.com/rvirding/luerl"
#SRC_URI="https://github.com/rvirding/luerl/archive/v${PV}.tar.gz -> ${P}.tar.gz"
EGIT_REPO_URI="https://github.com/rvirding/luerl.git"

LICENSE="Apache-2"
SLOT="0"
#KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND="dev-lang/erlang"
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/$(get_libdir)/luerl
	doins -r ebin
	dodoc README.md
}
