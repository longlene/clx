# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit common-lisp-3 elisp-common vcs-snapshot

EGIT_COMMIT="e9a46cba4c5a690b100b89edf3c85279437a2ac4"

DESCRIPTION="Common Lisp web framework"
HOMEPAGE="http://github.com/archimag/restas"
SRC_URI="https://github.com/archimag/restas/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="doc slime"

RDEPEND="
	dev-lisp/cffi
	dev-lisp/bordeaux-threads
	>=dev-lisp/cl-routes-0.2.2
	dev-lisp/data-sift
	dev-lisp/alexandria
	>=dev-lisp/hunchentoot-1.2.0
	slime? ( app-emacs/slime-archimag dev-lisp/closer-mop )
"

CLSYSTEMS="${PN}"
SITEFILE=70${PN}-gentoo.el

src_compile () {
	use slime && elisp-compile slime/${PN}.el
}

src_install() {
	common-lisp-3_src_install

	doinitd "${FILESDIR}"/restas.lo

	if use slime; then
		elisp-install ${PN} slime/${PN}.el
		elisp-site-file-install "${FILESDIR}"/${SITEFILE}
	fi
}

pkg_postinst() {
	use slime && elisp-site-regen
}

pkg_postrm() {
	use slime && elisp-site-regen
}

