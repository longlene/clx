# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit vcs-snapshot

EGIT_COMMIT="96a309acfe52544c4bbef5e5720b48dfad56200b"

DESCRIPTION="Zotonic - The Erlang Web Framework & CMS"
HOMEPAGE="http://zotonic.com"
SRC_URI="https://github.com/zotonic/zotonic/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-erlang/rebar:3
"
RDEPEND="${DEPEND}"
BDEPEND=""

RESTRICT=network-sandbox

src_compile() {
	rebar3 compile
}
