# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="4de2db85efa10953bf640eb6661873200a913a31"

DESCRIPTION="Common Lisp library for Avro"
HOMEPAGE="https://github.com/SahilKang/cl-avro"
SRC_URI="https://github.com/SahilKang/cl-avro/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/trivial-gray-streams
	dev-lisp/babel
	dev-lisp/ieee-floats
	dev-lisp/st-json
	dev-lisp/chipz
	dev-lisp/salza2
	test? ( dev-lisp/1am )
"
BDEPEND=""

src_prepare() {
	default
	if ! use test ; then
		sed -i '/defsystem #:cl-avro\/test/,$d' ${PN}.asd
		rm -r test
	fi
}
