# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit toolchain-funcs

MY_PN="diw"
DESCRIPTION="Tool used to create/integrate WADs using Edge DDF data"
HOMEPAGE="http://edge.sourceforge.net/"
SRC_URI="mirror://sourceforge/edge/${MY_PN}${PV}-src.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

S="${WORKDIR}/${PN}"

src_compile() {
	emake \
		CC="$(tc-getCC)" \
		CFLAGS="${CFLAGS}" \
		LDFLAGS="${LDFLAGS}" \
		|| die "emake failed"
}

src_install() {
	dobin ${PN} || die "dobin failed"
	dodoc readme.txt || die "dodoc failed"
}
