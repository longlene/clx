# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 elisp-common git-r3

DESCRIPTION="Common Lisp in the 21st Century"
HOMEPAGE="http://cl21.org"
SRC_URI=""

EGIT_REPO_URI="https://github.com/cl21/cl21.git"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="emacs test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cl-interpol
	dev-lisp/cl-ppcre
	dev-lisp/closer-mop
	dev-lisp/iterate
	dev-lisp/named-readtables
	dev-lisp/osicat
	dev-lisp/repl-utilities
	dev-lisp/split-sequence
	dev-lisp/trivial-types
	dev-lisp/trivial-gray-streams
	test? ( dev-lisp/cl-test-more )
"

src_prepare() {
	rm -rf t ${PN}-test.asd
}

src_install() {
	common-lisp-3_src_install
	use emacs && elisp-install ${PN}-mode.el
}

pkg_postinst() {
	use emacs && elisp-site-regen
}

pkg_postrm() {
	use emacs && elisp-site-regen
}
