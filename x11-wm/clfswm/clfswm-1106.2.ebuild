# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils multilib

MY_P="${P/./-}"
DESCRIPTION="100% Common Lisp X11 window manager (based on Tinywm and Stumpwm)"
HOMEPAGE="http://common-lisp.net/project/clfswm"
SRC_URI="http://common-lisp.net/project/${PN}/${MY_P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-lisp/clisp"

S=${WORKDIR}/${MY_P}

src_prepare() {
	epatch "${FILESDIR}"/${MY_P}-configure.patch
	epatch "${FILESDIR}"/${MY_P}-makefile.patch
}

src_configure() {
	./configure --prefix "${EPREFIX}"/usr \
		--libdir $(get_libdir) \
		--with-lisp clisp \
		--with-clfswm "${EPREFIX}"/usr/$(get_libdir)/${PN} \
		--with-asdf "${EPREFIX}"/usr/$(get_libdir)/${PN}/contrib \
		--lisp-bin "${EPREFIX}"/usr/bin/clisp \
		--lisp-opt "-K full" || die
}

src_install() {
	emake DESTDIR="${ED}"/usr install
	dodoc README ChangeLog
}

pkg_postinst() {
	elog "Clfswm will compile itself into \$XDG_CACHE_HOME!"
	elog "Make sure the variable is set."
	elog ""
	elog "If you want to use different lisp-implementations"
	elog "change the script '/usr/bin/clfswm'."
}
