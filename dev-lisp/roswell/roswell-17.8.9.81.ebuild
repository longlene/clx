# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools common-lisp-3

DESCRIPTION="Common Lisp environment setup Utility"
HOMEPAGE="https://github.com/snmsts/roswell"
SRC_URI="https://github.com/snmsts/roswell/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND="net-misc/curl"
RDEPEND="${DEPEND}
	dev-lisp/simple-date-time
	dev-lisp/split-sequence
	dev-lisp/plump
	dev-lisp/zip
	test? ( dev-lisp/prove )
"

src_prepare() {
	eapply_user
	use test || rm -rf ${PN}-test.asd t
	sed -i 's#`mkdir\ -p\ $(roslispdir);cd\ $(roslispdir);\ pwd\ -W\ 2>/dev/null`#$(roslispdir)#' Makefile.am || die "fix path failed"
	eautoreconf
}

src_install() {
	emake DESTDIR="${D}" install
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}
