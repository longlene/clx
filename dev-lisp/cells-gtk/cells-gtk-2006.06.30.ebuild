# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit common-lisp-2

MY_P="${P/./-}"
MY_P="${MY_P/./-}"
MY_P="${MY_P/./-}"

DESCRIPTION="Cells is a Common Lisp library providing a data flow extension to CLOS."
HOMEPAGE="http://common-lisp.net/project/cells/
	http://www.tilton-technology.com/cells_top.html"
SRC_URI="http://www.common-lisp.net/project/${PN}/files/${MY_P}.tgz"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE=""

DEPEND=">=dev-lisp/cells-2
	dev-lisp/cffi
	>=x11-libs/gtk+-2"

S="${WORKDIR}/${MY_P}/root"

src_compile() {
	cd "${S}/gtk-ffi"
	emake || die "Could not make ffi"
}

src_install() {
	cd "${S}"

	insinto /usr/lib
	doins gtk-ffi/libcellsgtk.so

	common-lisp-install pod-utils/*.{lisp,asd} \
	                    gtk-ffi/*.{lisp,asd} \
	                    ph-maths/*.{lisp,asd} \
	                    pod-utils/*.{lisp,asd} \
	                    ${PN}/*.{lisp,asd} \
	                    ${PN}/test-gtk/*.{lisp,asd} \

	common-lisp-symlink-asdf pod-utils/pod-utils \
	                         gtk-ffi/gtk-ffi \
	                         ph-maths/ph-maths \
	                         pod-utils/pod-utils \
	                         ${PN}/${PN} \
	                         ${PN}/test-gtk/test-gtk
}
