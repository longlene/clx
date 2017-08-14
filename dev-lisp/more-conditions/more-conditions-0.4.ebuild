# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

DESCRIPTION="Some general condition classes and signalling helpers"
HOMEPAGE="https://github.com/scymtym/more-conditions"
SRC_URI="https://github.com/scymtym/more-conditions/archive/release-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	test? ( dev-lisp/lift )
"

src_prepare() {
	eapply_user
	if ! use test ; then
		sed -i '/defsystem\ :more-conditions-test/,$d' ${PN}.asd
		rm -r test
	fi
}

#src_install() {
#	common-lisp-3_src_install
#	common-lisp-install-sources -t all version-string.sexp
#}
