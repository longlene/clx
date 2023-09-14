# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit flag-o-matic

DESCRIPTION="C++ ATMI wrapper"
HOMEPAGE="https://github.com/HerbertKoelman/cpp-atmi"
SRC_URI="https://github.com/HerbertKoelman/cpp-atmi/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	>=sys-cluster/tuxedo-12.2.2.0.0
"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	append-cppflags -std=c++11
	sed -i 's/utls//g' configure
	sed -i '/utls/d' Makefile.in
	sed -i '/gencat/{/fr_FR/d}' src/Makefile.in
}

src_configure() {
	econf --enable-release --prefix="${D}"/usr
}

src_install() {
	insinto /usr
	doins -r include
	dolib.a lib/lib{atmi++,cltatmi++,fml++}.a
	dodoc README.md
}
