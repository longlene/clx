# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="1867afb1fe75dcc8b72f139a4bb5290b70bc1cad"

DESCRIPTION="Simple color library for Common Lisp"
HOMEPAGE="http://cliki.net/cl-colors"
SRC_URI="https://github.com/tpapp/cl-colors/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Boost-1.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

RDEPEND="
	dev-lisp/alexandria
	dev-lisp/let-plus
	test? ( dev-lisp/lift )
"

src_prepare() {
	eapply_user
	if ! use test ; then
		sed -i '/defsystem #:cl-colors-tests/,$d' ${PN}.asd
		rm test.lisp
	fi
}
