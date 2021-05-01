# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3

DESCRIPTION="Metap provides metaclass propagation along class inheritance structure in Common Lisp"
HOMEPAGE="https://github.com/hipeta/metap"
SRC_URI="https://github.com/hipeta/metap/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/closer-mop
	test? ( dev-lisp/fiveam )
"

src_prepare() {
	eapply_user
	use test || rm ${PN}-test.asd ${PN}-test.lisp
}
