# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="23bb64f31c1bfcd8ca12f42cbc0f3547bed8af2b"

DESCRIPTION="A cache-busting static asset middleware for the clack web framework"
HOMEPAGE="https://github.com/fisxoj/clack-static-asset-middleware"
SRC_URI="https://github.com/fisxoj/clack-static-asset-middleware/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/ironclad
	dev-lisp/cl-ppcre
	dev-lisp/local-time
	dev-lisp/trivial-mimes
"
BDEPEND=""

src_prepare() {
	default
	rm -rf ${PN}-test.asd t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.markdown
}
