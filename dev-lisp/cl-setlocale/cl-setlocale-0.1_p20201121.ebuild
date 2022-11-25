# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="f660d07dac72bc3e99caae1c6c8a789991e2694c"

DESCRIPTION="A wrapper around setlocale(3) for Common Lisp"
HOMEPAGE="https://github.com/shamazmazum/cl-setlocale/"
SRC_URI="https://github.com/shamazmazum/cl-setlocale/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"
IUSE="test"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
"
BDEPEND=""

src_prepare() {
	default
	if ! use test ; then
		sed -i '/defsystem :cl-setlocale\/tests/,$d' ${PN}.asd
		rm -r tests
	fi
}
