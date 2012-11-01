# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-tinyos/tos/tos-1.1.15-r1.ebuild,v 1.6 2010/02/06 11:58:14 ulm Exp $
inherit eutils

CVS_MONTH="Dec"
CVS_YEAR="2005"
MY_PN="tinyos"
MY_P=${MY_PN}-${PV}${CVS_MONTH}${CVS_YEAR}cvs

DESCRIPTION="TinyOS: an open-source OS designed for wireless embedded sensor networks"
HOMEPAGE="http://www.tinyos.net/"
SRC_URI="http://www.tinyos.net/dist-1.1.0/tinyos/source/${MY_P}.tar.gz"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="doc"
DEPEND="doc? ( sys-devel/m4
	virtual/latex-base
	dev-tex/latex2html )"
RDEPEND=""

#Required to do anything useful. Could not be a RDEPEND since portage try to emerge nesc before tos.
PDEPEND="dev-tinyos/nesc"

S=${WORKDIR}/${MY_P}
src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}/tos-1.1.15-system-AMStandard-Control.patch"
	sed -i -e "s:psfig:epsfig:" "${S}/doc/schemadocsrc/tinyschema.tex" \
		|| die "Error while updating tex sources."
	einfo "removing CVS dirs"
	for i in `find . -name CVS`; do
		rm -rf "${i}"
	done
}

src_compile() {
	if use doc
	then
		make -C doc && make -C doc install-snapshots.html || die "Make error in tinyos-1.x/doc"
		make -C doc/tex || die "Unable to make docs from tex sources"
		make -C doc/schemadocsrc || die "Unable to make docs from tex sources"
		make -C doc/schemadocsrc tinyschema.html || die "Unable to make docs from tex sources"
	else
		einfo "Nothing to compile."
	fi
}

src_install() {
	insinto /usr/src/tinyos-1.x
	doins -r tos
	chown -R root:0 "${D}"
	dodoc ChangeLog
	if use doc
	then
		dohtml -A pdf,gif,html -r doc/*
		dodoc doc/*.txt
	fi
	doenvd "${FILESDIR}"/99tinyos
}

pkg_postinst() {
	elog "If you want to use TinyOS on real hardware you need a cross compiler."
	elog "You should emerge sys-devel/crossdev and compile any toolchain you need"
	elog "Example: for Mica2 and Mica2 Dot: crossdev --target avr"
	ebeep 5
	epause 5
}
