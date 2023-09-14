# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="6a5ada401e57da2c8abf046f582029926e61fce8"

DESCRIPTION="A Common Lisp function caching / memoization library"
HOMEPAGE="https://github.com/AccelerationNet/function-cache"
SRC_URI="https://github.com/AccelerationNet/function-cache/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cl-interpol
	dev-lisp/iterate
	dev-lisp/symbol-munger
	dev-lisp/closer-mop
	test? ( dev-lisp/lisp-unit2 )
"
BDEPEND=""

src_prepare() {
	default
	if ! use test ; then
		sed -i '/defsystem function-cache\/test/,$d' ${PN}.asd
		rm -r test
	fi
}
