# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="6cf80042bf41b50876778221fe77016a4bb42800"

DESCRIPTION="Random forest in Common Lisp"
HOMEPAGE="https://github.com/masatoi/cl-random-forest"
SRC_URI="https://github.com/masatoi/cl-random-forest/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-libsvm-format
	dev-lisp/cl-online-learning
	dev-lisp/alexandria
	dev-lisp/lparallel
	test? ( dev-lisp/prove )
"

src_prepare() {
	default
	use test || rm -r ${PN}-test.asd t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.org
}
