# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="MAD: Manage Dependencies"
HOMEPAGE="http://mad.n2o.space"
SRC_URI="https://github.com/synrc/mad/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-lang/erlang
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	./mad com bun mad || die "compile failed"
}

src_install() {
	dobin mad
	dodoc README.md
}
