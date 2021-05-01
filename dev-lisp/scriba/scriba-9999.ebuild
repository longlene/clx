# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3 elisp-common git-r3

DESCRIPTION="A markup language with Scribe syntax"
HOMEPAGE="https://github.com/CommonDoc/scriba"
SRC_URI=""

EGIT_REPO_URI="https://github.com/CommonDoc/scriba.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="emacs test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/common-doc-plump
	dev-lisp/plum-sexp
	dev-lisp/esrap
	test? ( dev-lisp/fiveam )
"

src_prepare() {
	eapply_user
	use test || rm ${PN}-test.asd t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
	use emacs && elisp-install ${PN} *.el
}

pkg_postinst() {
	if use emacs; then
		elisp-site-regen
	fi
}

pkg_postrm() {
	if use emacs; then
		elisp-site-regen
	fi
}

