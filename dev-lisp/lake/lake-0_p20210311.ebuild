# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="38f5b54a985bb27b771bb249d77bcfbf22dfbd20"

DESCRIPTION="Lake is a GNU make like build utility in Common Lisp"
HOMEPAGE="https://github.com/takagi/lake"
SRC_URI="https://github.com/takagi/lake/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cl-syntax
	dev-lisp/lparallel
	dev-lisp/split-sequence
	test? ( dev-lisp/prove )
"

src_prepare() {
	default
	use test || rm -rf t ${PN}-test.asd
}

# TODO: roswell things need process

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}
