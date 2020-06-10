# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGIT_COMMIT="24b9564f76ff2a85a1b6b62f9182697f17f144ab"

DESCRIPTION="A Matrix client library for Common Lisp"
HOMEPAGE="https://gitlab.com/Gnuxie/cl-matrix"
SRC_URI="https://gitlab.com/Gnuxie/cl-matrix/repository/archive.tar.gz?ref=${EGIT_COMMIT} -> ${P}.tar.gz"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/jsown
	dev-lisp/drakma
	dev-lisp/method-hooks
	dev-lisp/documentation-utils
"
BDEPEND=""

src_prepare() {
	default
	use test || rm ${PN}-test.asd test
}
