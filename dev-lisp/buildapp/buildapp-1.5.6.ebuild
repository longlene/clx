# Copyright 2008-2012 Funtoo Technologies
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit common-lisp-3

DESCRIPTION="Create executables with SBCL"
HOMEPAGE="http://www.xach.com/lisp/buildapp/"
SRC_URI="http://github.com/xach/buildapp/archive/release-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
		dev-lisp/sbcl"

src_compile() {
	emake || die "emake failed"
}

src_install() {
	common-lisp-3_src_install
	dobin buildapp
	dodoc README
	dodoc doc/LICENSE
	dohtml doc/{index.html,style.css}
}

