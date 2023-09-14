# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

DESCRIPTION="A framework to build readline applications out of existing code"
HOMEPAGE="https://github.com/vindarel/replic/"
SRC_URI="https://github.com/vindarel/replic/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-readline
	dev-lisp/alexandria
	dev-lisp/cl-str
	dev-lisp/cl-ansi-text
	dev-lisp/unix-opts
	dev-lisp/py-configparser
	test? ( dev-lisp/prove )
"
BDEPEND=""

src_prepare() {
	default
	use test || rm -r ${PN}-test.asd tests
}

src_compile() {
	:
}
