# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit common-lisp-2

DESCRIPTION="cl-launch is a utility to make Common Lisp software easily invokable from the command-line."
HOMEPAGE="http://www.cliki.net/cl-launch"
SRC_URI="http://common-lisp.net/project/xcvb/${PN}/${PN}-${PV}.tar.gz"
#SRC_URI="http://common-lisp.net/~sionescu/files/${PN}_${PV}.tar.gz"
LICENSE="No-Problem-Bugroff LLGPL-2.1"

SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86 ~arm"
IUSE=""

CL_LAUNCH_FASLDIR=/var/cache/cl-launch

src_unpack() {
	unpack ${A}
	mv ${PN}* "${S}"
}

src_install() {
	dobin cl-launch.sh
	dobin cl-launch
	common-lisp-install launcher.lisp wrapper.sh cl-launch.asd
	common-lisp-symlink-asdf
	keepdir "${CL_LAUNCH_FASLDIR}"
	fperms 1777 "${CL_LAUNCH_FASLDIR}"
}
