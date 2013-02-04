# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit common-lisp-2 elisp-common eutils

DESCRIPTION="Common Lisp application server"
HOMEPAGE="http://github.com/archimag/restas"
SRC_URI="http://restas.googlecode.com/files/${P}.tar.bz2"

LICENSE="LLGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE="doc slime"

RDEPEND=" >=dev-lisp/cl-routes-0.2.2
         dev-lisp/data-sift
         dev-lisp/alexandria
		 >=dev-lisp/hunchentoot-1.2.0
		 slime? ( app-emacs/slime-archimag dev-lisp/closer-mop )"

CLSYSTEMS="${PN}"
SITEFILE=70${PN}-gentoo.el

src_compile () {
	if use slime ; then
		elisp-compile slime/${PN}.el || die "Cannot compile elisp files"
	fi
}

src_install() {
	common-lisp-install *.asd src contrib slime/restas-swank.lisp
	common-lisp-symlink-asdf

	doinitd "${FILESDIR}"/restas.lo || die "doinitd failed"

	if use slime; then
		elisp-install ${PN} slime/${PN}.el || die "Cannot install elisp sources"
		elisp-site-file-install "${FILESDIR}"/${SITEFILE} || die "Cannot install elisp site file"
	fi

	dodoc COPYING
}

pkg_postinst() {
	use slime && elisp-site-regen
}

pkg_postrm() {
	use slime && elisp-site-regen
}

