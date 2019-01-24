# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="1abe83562785619e6fce7797c625c19820536394"

DESCRIPTION="SQL Mapping Framework for Common Lisp"
HOMEPAGE="https://github.com/tamurashingo/cl-batis"
SRC_URI="https://github.com/tamurashingo/cl-batis/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-dbi-connection-pool
	dev-lisp/cl-ppcre
	dev-lisp/cl-syntax
	test? ( dev-lisp/prove )
"
BDEPEND=""

src_prepare() {
	default
	use test || rm -r batis-test.asd t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.markdown
}
