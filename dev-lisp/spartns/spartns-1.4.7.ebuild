# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

DESCRIPTION="Spartns is a SPARse TeNSor representation library"
HOMEPAGE="https://github.com/jpellegrini/spartns"
SRC_URI="https://github.com/jpellegrini/spartns/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	if ! use test ; then
		sed -e '/defsystem\ spartns-test/,$d' -i ${PN}.asd
		rm lisp-unit.lisp spartns-test-package.lisp utils-test.lisp tests.lisp
	fi
}

