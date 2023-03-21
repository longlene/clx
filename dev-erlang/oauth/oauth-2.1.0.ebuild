# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit vcs-snapshot

DESCRIPTION="An Erlang OAuth 1.0 implementation"
HOMEPAGE="https://github.com/tim/erlang-oauth"
SRC_URI="https://github.com/tim/erlang-oauth/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	insinto /usr/$(get_libdir)/erlang/lib
	doins -r ebin
	dodoc README.md
}
