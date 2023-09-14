# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Copper is a simple imperative language statically typed with tpe inference and genericity"
HOMEPAGE="http://tibleiz.net/copper"
SRC_URI="http://tibleiz.net/download/copper-${PV}-src.tar.gz -> ${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+llvm"

DEPEND=""
RDEPEND="${DEPEND}
sys-libs/ncurses
sys-devel/llvm"

QA_PRESTRIPPED="/usr/bin/copper-llvm /usr/bin/copper-elf /usr/bin/copper-coff"

src_prepare() {
	epatch "${FILESDIR}/${P}-fixes.patch"
}

src_compile() {
	if use amd64 ; then
		emake boot64
	else
		if use llvm ; then
			emake BACKEND=llvm
		else
			emake
		fi
	fi
}

src_install() {
	if use llvm ; then
		emake prefix=${D}/usr BACKEND=llvm install
	else
		emake prefix=${D}/usr install
	fi
}
