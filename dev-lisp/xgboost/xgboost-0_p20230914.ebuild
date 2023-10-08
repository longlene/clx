# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="127247805215c78ad858295e13c88033071ee12b"

DESCRIPTION="Common Lisp interface to xgboost"
HOMEPAGE="https://gitlab.common-lisp.net/cungil/xgboost"
SRC_URI="https://gitlab.common-lisp.net/cungil/xgboost/-/archive/${EGIT_COMMIT}/xgboost-${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/trivial-garbage 
	dev-lisp/cffi 
	dev-lisp/cl-autowrap 
	dev-lisp/cl-json
	sc-libs/xgboost
"
BDEPEND=""

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all ffi
}
