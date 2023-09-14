# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="e45e9bfba61b542c054a3a41cb7a8cfc1a2cb156"

DESCRIPTION="Streamlined relational database interfacing for Common Lisp"
HOMEPAGE="https://github.com/rmhsilva/oook/"
SRC_URI="https://github.com/rmhsilva/oook/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/anaphora
	dev-lisp/cl-inflector
	dev-lisp/closer-mop
	dev-lisp/clsql
	dev-lisp/jonathan
	dev-lisp/parse-number
	dev-lisp/spinneret
	test? ( dev-lisp/2am )
"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}-test.asd test
}
