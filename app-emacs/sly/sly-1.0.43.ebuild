# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 elisp eutils vcs-snapshot

DESCRIPTION="Sylvester the Cat's Common Lisp IDE"
HOMEPAGE="https://github.com/joaotavora/sly"
SRC_URI="https://github.com/joaotavora/sly/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="doc"

RDEPEND="virtual/commonlisp
		dev-lisp/asdf"
DEPEND="${RDEPEND}
		>=sys-apps/texinfo-5.1
		doc? ( virtual/texi2dvi )"

CLPACKAGE=slynk
CLSYSTEMS=slynk
SITEFILE=70${PN}-gentoo.el

src_compile() {
	elisp-compile *.el || die
	BYTECOMPFLAGS="${BYTECOMPFLAGS} -L contrib -l sly" \
		elisp-compile contrib/*.el lib/*.el || die
	emake -j1 -C doc sly.info

	use doc && VARTEXFONTS="${T}"/fonts emake -j1 -C doc sly.pdf
}

src_install() {
	elisp-install ${PN} *.{el,elc} 
	elisp-site-file-install "${FILESDIR}"/${SITEFILE} || die

	common-lisp-install-sources slynk/backend/*.lisp slynk/*.lisp
	common-lisp-install-asdf slynk/slynk.asd

	## install contribs
	elisp-install ${PN}/contrib/ contrib/*.{el,elc} \
		|| die "Cannot install contribs"
	common-lisp-install-sources contrib/*.lisp

	## install lib
	elisp-install ${PN}/lib/ lib/*.{el,elc} || die "Cannot install libs"

	## install docs
	dodoc README.md CONTRIBUTING.md PROBLEMS.md
	doinfo doc/sly.info
	use doc && dodoc doc/*.pdf
}
