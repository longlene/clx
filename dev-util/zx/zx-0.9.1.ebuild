# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="The Zomp client"
HOMEPAGE="https://gitlab.com/zxq9/zx/"
SRC_URI="https://zxq9.com/projects/zomp/${P}.tar.xz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-lang/erlang
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	cd zomp/lib/otpr/zx/${PV} && ./make_zx || die "compile failed"
}

src_install() {
	insinto /usr/lib
	doins -r zomp
	dobin ${FILEDIRS}/zx
	dodoc README.md
}
