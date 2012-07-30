# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-gfx/nvidia-cg-toolkit/nvidia-cg-toolkit-2.0.0015.ebuild,v 1.1 2008/06/28 07:46:07 maekke Exp $

inherit versionator

MY_PV="$(get_version_component_range 1-2)"
MY_DATE="February2009"
DESCRIPTION="nvidia's c graphics compiler toolkit"
HOMEPAGE="http://developer.nvidia.com/object/cg_toolkit.html"
SRC_URI="x86? (
	http://developer.download.nvidia.com/cg/Cg_${MY_PV}/${PV}/Cg-${MY_PV}_${MY_DATE}_x86.tgz )
	amd64? ( http://developer.download.nvidia.com/cg/Cg_${MY_PV}/${PV}/Cg-${MY_PV}_${MY_DATE}_x86.tgz
		http://developer.download.nvidia.com/cg/Cg_${MY_PV}/${PV}/Cg-${MY_PV}_${MY_DATE}_x86_64.tgz )"

LICENSE="NVIDIA"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="virtual/glut"

RESTRICT="strip"

S="${WORKDIR}"

src_compile() {
	ewarn "Binary blobs !"
	einfo "Nothing to compile."
}

src_install() {
	dobin usr/bin/cgc

	if use x86; then
		dolib usr/lib/*
	elif use amd64; then
		mv usr/lib usr/lib32
		insinto "/usr/lib32"
		doins usr/lib32/* || die
		dolib usr/lib64/* || die
	fi

	doenvd "${FILESDIR}"/80cgc

	insinto /usr/include/Cg
	doins usr/include/Cg/*

	doman 	usr/share/man/man3/*

	dodoc usr/local/Cg/MANIFEST usr/local/Cg/README \
	      usr/local/Cg/docs/*.pdf usr/local/Cg/docs/CgReferenceManual.chm

	docinto html
	dohtml	usr/local/Cg/docs/html/*

	docinto examples
	dodoc   usr/local/Cg/examples/README

	docinto include/GL
	dodoc   usr/local/Cg/include/GL/*

	# Copy all the example code.
	cd usr/local/Cg/examples
	insinto /usr/share/doc/${PF}/examples
	doins Makefile
	for dir in $(find * -type d) ; do
		insinto usr/share/doc/${PF}/examples/"${dir}"
		doins "${dir}"/*
	done
}
