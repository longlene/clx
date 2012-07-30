# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils toolchain-funcs

DESCRIPTION="MIRACL crypto library"

HOMEPAGE="http://www.shamus.ie"

#the zip might change upstream, suggest mirroring 
SRC_URI="ftp://ftp.computing.dcu.ie/pub/crypto/${PN}.zip"

LICENSE="free-noncomm"
SLOT="0"
KEYWORDS="~amd64"

IUSE="amd64"

DEPEND="app-arch/unzip"
RDEPEND="${DEPEND}"

S="${WORKDIR}"


src_unpack() {
	vecho ">>> Unpacking ${A} to ${PWD}"

	unzip -qo -j -aa -L "${DISTDIR}/${A}" || die "failure unpacking {$A}"
	cd "${S}"

	if use amd64; then
		# The source tarball provides no Makefile/autoconf
		# Instead of providing a patch with a Makefile, let's just modify the given compile script
		local script="linux64"
		local myfail="Failed to update build script"
		einfo "Applying amd64 patches to build script"
		sed -i \
		-e "s:gcc -c -O2:gcc -c -O2 -fPIC:" \
		${script} || die ${myfail}
	fi

}

src_compile() {
	if use amd64; then
		local script="linux64"
	else
		local script="linux"
	fi

	# source tarbal provides a linux compile script -- No output given
	sh ${script} || die "Compile failed"
}

src_install() {
	cd ${S}
	dolib.a miracl.a || die "Installing library failed"

	insopts -m 644
	insinto /usr/include
	doins miracl.h mirdef.h || die "Installing headers failed"

	dodoc update.txt first.txt problems.txt readme.txt
}
