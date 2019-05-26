# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="454466edb89f5d9ab6a7e6e2dd66a0a234f8759d"

DESCRIPTION="Common Lisp CFFI wrapper for librdkafka"
HOMEPAGE="https://github.com/SahilKang/cl-rdkafka/"
SRC_URI="https://github.com/SahilKang/cl-rdkafka/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-libs/librdkafka
	dev-lisp/cffi
	dev-lisp/babel
	dev-lisp/trivial-garbage
	dev-lisp/bordeaux-threads
	test? ( dev-lisp/fiveam )
"
BDEPEND=""

src_prepare() {
	default
	if ! use test ; then
		sed -i '/defsystem :cl-rdkafka\/test/,$d' ${PN}.asd
		rm -r test
	fi
}
