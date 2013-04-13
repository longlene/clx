# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit common-lisp-3 elisp-common eutils

DESCRIPTION="Common Lisp implementation of Google's Closure Templates."
HOMEPAGE="http://code.google.com/p/cl-closure-template/"
SRC_URI="https://github.com/archimag/cl-closure-template/archive/version-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE="doc emacs"

RDEPEND="dev-lisp/asdf-system-connections
		dev-lisp/babel
		dev-lisp/parenscript
		dev-lisp/split-sequence
		dev-lisp/wiki-parser
		dev-lisp/lift
		emacs? ( virtual/emacs )"

CLSYSTEMS="closure-template"
SITEFILE="50${PN}-gentoo.el"

S="${WORKDIR}/${PN}-version-${PV}"

src_install() {
	common-lisp-install-sources -t all src t
	common-lisp-install-asdf ${CLSYSTEMS}

	if use doc; then
		insinto /usr/share/doc/${PF}/examples
		doins -r example/* || die "Cannot install examples"
	fi

	if use emacs; then
		elisp-install ${PN} closure-template-html-mode.el || die "Cannot install elisp sources"
		elisp-site-file-install "${FILESDIR}"/${SITEFILE} || die "Cannot install elisp site file"
	fi

	dodoc README.markdown
}

pkg_postinst() {
	use emacs && elisp-site-regen
}

pkg_postrm() {
	use emacs && elisp-site-regen
}
