# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

inherit eutils versionator multilib

MY_P=netgen
#$(delete_version_separator 1)

DESCRIPTION="Automatic mesh generator"
HOMEPAGE="http://sourceforge.net/projects/netgen-mesher/"
SRC_URI="http://downloads.sourceforge.net/netgen-mesher/${PF}.tar.gz"

LICENSE="LGPL-2.1"
KEYWORDS="~amd64 ~x86"
IUSE="doc opencascade"
SLOT="0"

RDEPEND="dev-tcltk/tix
	dev-lang/tcl
	dev-lang/tk
	=dev-tcltk/togl-1.7
	virtual/opengl
	x11-libs/libXmu
	opencascade? ( sci-libs/opencascade )"

DEPEND="${RDEPEND}
	lapack? ( dev-util/pkgconfig )"

src_unpack() {
	unpack ${A}
	cd "${S}"
}

src_compile() {
	local confflags
	use opencascade && elog "opencascade support not yet tested!"
	use opencascade && confflags="${confflags} --enable-occ"

	cd ${WORKDIR}/${PF}
	TEMPDEST="${D}opt/${MY_P}/"
	econf \
		--libdir="${TEMPDEST}lib" \
		--includedir="${TEMPDEST}include" \
		--bindir="${TEMPDEST}bin" \
		--datadir="${TEMPDEST}share" \
		--docdir="${TEMPDEST}doc" \
		--with-togl="/usr/lib/Togl1.7"
		${confflags} \
		|| die "failed to configure"

	emake || die "emake failed"
}

src_install() {

	mkdir ${D}etc
	mkdir ${D}etc/env.d

	echo -e "LD_LIBRARY_PATH=\"/opt/${MY_P}/lib:/usr/lib/Togl1.7\"\nNETGENDIR=\"/opt/${MY_P}/bin\"
PATH=\"/opt/${MY_P}/bin\" " > ${D}etc/env.d/99netgen

        make install || die "make install failed"

	if use doc; then
		insinto /usr/share/doc/${PF}
		doins doc/ng4.pdf || die "failed to install doc"
	fi
}

pkg_postinst() {
	elog "Please make sure to update your environment variables:"
	elog "env-update && source /etc/profile"
	elog "Netgen ebuild is still under development."
	elog "Help us improve the ebuild in:"
	elog "http://bugs.gentoo.org/show_bug.cgi?id=155424"
}
