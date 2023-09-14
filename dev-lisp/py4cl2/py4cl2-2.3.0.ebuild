# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

DESCRIPTION="https://github.com/digikar99/py4cl2"
HOMEPAGE="https://github.com/digikar99/py4cl2"
SRC_URI="https://github.com/digikar99/py4cl2/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/trivial-garbage
	dev-lisp/iterate
	dev-lisp/cl-json
	dev-lisp/bordeaux-threads
	dev-lisp/parse-number
	dev-lisp/uiop
	dev-lisp/numpy-file-format
"
BDEPEND=""

src_prepare() {
	default
	use test || rm -r ${PN}-tests.asd tests
}
