# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="Common Lisp CFFI wrapper for librdkafka"
HOMEPAGE="https://github.com/SahilKang/cl-rdkafka/"
SRC_URI="https://github.com/SahilKang/cl-rdkafka/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-libs/librdkafka
	dev-lisp/cffi
	dev-lisp/trivial-garbage
	dev-lisp/bordeaux-threads
	dev-lisp/lparallel
	test? ( dev-lisp/fiveam dev-lisp/babel )
"
BDEPEND=""

src_prepare() {
	default
	if ! use test ; then
		sed -i '/defsystem :cl-rdkafka\/test/,$d' ${PN}.asd
		rm -r test
	fi
}
