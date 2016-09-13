# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit common-lisp-3

MY_P="${P/-/_}"

DESCRIPTION="Cells is a Common Lisp library providing a data flow extension to CLOS."
HOMEPAGE="http://common-lisp.net/project/cells/
	http://www.tilton-technology.com/cells_top.html"
SRC_URI="http://www.common-lisp.net/project/cells/asdf-install/cells_2.0.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86 ~arm"
IUSE=""

DEPEND=""

S=${WORKDIR}/${MY_P}

src_install() {
	cd "${S}"

	common-lisp-install utils-kt/*.{asd,lisp} \
	                    *.{asd,lisp} \
	                    ${PN}-test/*.lisp

	common-lisp-symlink-asdf utils-kt/utils-kt \
	                         ${PN}
}
