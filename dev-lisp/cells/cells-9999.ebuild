# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

ECVS_SERVER="common-lisp.net:/project/cells/cvsroot"
ECVS_MODULE="cells"
ECVS_USER="anonymous"
ECVS_PASS="anonymous"
ECVS_CVS_OPTIONS="-dP"

inherit common-lisp-3 cvs

DESCRIPTION="Cells is a Common Lisp library providing a data flow extension to CLOS."
HOMEPAGE="http://common-lisp.net/project/cells/
	http://www.tilton-technology.com/cells_top.html"
SRC_URI=""

LICENSE="BSD"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""

S="${WORKDIR}/${ECVS_MODULE}"

src_install() {
	cd "${S}"

	common-lisp-install utils-kt/*.{asd,lisp} \
	                    *.{asd,lisp} \
	                    ${PN}-test/*.lisp

	common-lisp-symlink-asdf utils-kt/utils-kt \
	                         ${PN}
}
