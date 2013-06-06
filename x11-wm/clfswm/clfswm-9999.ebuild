# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils multilib git-2

DESCRIPTION="100% Common Lisp X11 window manager (based on Tinywm and Stumpwm)"
HOMEPAGE="http://common-lisp.net/project/clfswm"
SRC_URI=""

EGIT_REPO_URI="http://common-lisp.net/r/projects/clfswm/clfswm.git"

LICENSE="GPL-3"
SLOT="0"
#KEYWORDS="~amd64 ~x86"
KEYWORDS=""
IUSE=""

RDEPEND="|| ( dev-lisp/clisp dev-lisp/sbcl dev-lisp/ecls dev-lisp/cmucl dev-lisp/clozurecl )"

src_install() {
	emake DESTDIR="${ED}"/usr install
}

pkg_postinst() {
	elog "Clfswm will compile itself into \$XDG_CACHE_HOME!"
	elog "Make sure the variable is set."
	elog ""
	elog "If you want to use different lisp-implementations"
	elog "change the script '/usr/bin/clfswm'."
}
