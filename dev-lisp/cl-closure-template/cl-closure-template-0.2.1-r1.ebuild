# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 elisp-common eutils vcs-snapshot

DESCRIPTION="Common Lisp implementation of Google's Closure Templates."
HOMEPAGE="http://code.google.com/p/cl-closure-template/"
SRC_URI="https://github.com/archimag/cl-closure-template/archive/version-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86 ~arm"
IUSE="doc emacs test"

RDEPEND="
	dev-lisp/babel
	dev-lisp/parenscript
	dev-lisp/split-sequence
	dev-lisp/wiki-parser
	test? ( dev-lisp/lift )
	dev-lisp/esrap
	dev-lisp/closer-mop
	emacs? ( virtual/emacs )
"
SITEFILE="50${PN}-gentoo.el"

src_prepare() {
	eapply_user
	if ! use test; then
		sed -e '/test-op/,$d' -i closure-template.asd
	fi
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all src t

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
