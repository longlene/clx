# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils elisp

DESCRIPTION="draft ANSI Common Lisp standard"
HOMEPAGE="http://www.phys.au.dk/~harder/dpans.html"
SRC_URI="http://www.phys.au.dk/~harder/${P}.tar.gz
	http://quimby.gnus.org/circus/cl/dpANS3.tar.gz
	http://quimby.gnus.org/circus/cl/dpANS3R.tar.gz"

LICENSE="GPL2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"

IUSE="emacs html"

DEPEND=">=sys-apps/texinfo-4.7"
RDEPEND="emacs? ( virtual/emacs )"

MY_DIST="${PORTAGE_ACTUAL_DISTDIR-${DISTDIR}}/dpans"

SITEFILE=80${PN}-gentoo.el

src_compile() {
	mv -f ../dpANS3/*.tex . && \
	mv -f ../dpANS3R/*.tex . || die "Moving tex files failed."
	econf || die "econf failed"
	emake || die "emake failed"
	use html && make html
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"

	elisp-site-file-install "${FILESDIR}/${SITEFILE}" \
		|| die "elisp-site-file-install failed"

	dodoc README
	use html && dohtml ansicl.html/*
}

pkg_postinst() {
	echo
	use emacs && einfo "Emacs usage:  <F1> S  (info-lookup-symbol)"
	echo
}
