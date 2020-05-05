# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 elisp-common vcs-snapshot

EGIT_COMMIT="ee4717960dc7d4695a211e7363b812da10127f61"

DESCRIPTION="Yet another template system for Common Lisp"
HOMEPAGE="https://github.com/mmontone/ten/"
SRC_URI="https://github.com/mmontone/ten/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="emacs test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/access
	dev-lisp/esrap
	dev-lisp/cl-who
	dev-lisp/split-sequence
	test? ( dev-lisp/fiveam )
"
BDEPEND=""

src_prepare() {
	default
	use test || rm -r ${PN}.tests.asd tests.lisp ${PN}.examples.asd examples
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
	use emacs && elisp-install ten ten.el
}

pkg_postinst() {
	use emacs && elisp-site-regen
}

pkg_postrm() {
	use emacs && elisp-site-regen
}
