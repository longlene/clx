# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

ECVS_SERVER="common-lisp.net:/project/cells/cvsroot"
ECVS_MODULE="cells-gtk3"
ECVS_USER="anonymous"
ECVS_PASS="anonymous"
ECVS_CVS_OPTIONS="-dP"

inherit common-lisp-2 cvs

DESCRIPTION="Cells is a Common Lisp library providing a data flow extension to CLOS."
HOMEPAGE="http://common-lisp.net/project/cells/
	http://www.tilton-technology.com/cells_top.html"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE=""

DEPEND=">=dev-lisp/cells-2
	>=dev-lisp/cffi-0.10.0
	>=x11-libs/gtk+-2"

S="${WORKDIR}/${ECVS_MODULE}"

src_compile() {
	cd "${S}/gtk-ffi"
	emake || die "Could not make ffi"
}

src_install() {
	cd "${S}"

	# Patch needed for cffi >= 0.9.2 is not yet in CVS. See:
	# http://common-lisp.net/pipermail/cells-gtk-devel/2008-June/000569.html
	epatch "${FILESDIR}/0005-Upgrade-CFFI-to-current-darcs-0.9.2.patch"
	epatch "${FILESDIR}/0009-cells-gtk-rename-container.patch"

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
