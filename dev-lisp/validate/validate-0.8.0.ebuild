# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3

DESCRIPTION="Data validation library for common lisp"
HOMEPAGE="https://github.com/fisxoj/validate"
SRC_URI="https://github.com/fisxoj/validate/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/iterate
	dev-lisp/cl-ppcre
	dev-lisp/alexandria
	dev-lisp/local-time
	test? ( dev-lisp/prove )
"
BDEPEND=""

src_prepare() {
	default
	use test || rm ${PN}-test.asd t
}
