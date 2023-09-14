# Copyright 2008-2016 Funtoo Technologies
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

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

QA_PRESTRIPPED="/usr/bin/buildapp"

src_compile() {
	emake
}

src_install() {
	common-lisp-3_src_install
	dobin buildapp
	dodoc README
	dodoc doc/LICENSE doc/{index.html,style.css}
}

