# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit qt4-r2

DESCRIPTION="A KXDocker replacement that works together with a compositing
window manager."
HOMEPAGE="http://xqde.xiaprojects.com/"
SRC_URI="http://xqde.xiaprojects.com/?downloadfile=downloads/Sources/${P}.tar.bz2"

# For some reason the app has "lib" prepended to it (although it is not).
PROJ=libxqdebase

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="debug"

# I don't know what version of libXcomposite it requires so I just grabbed the
# most recent version in the portage tree :/
RDEPEND=">=x11-libs/qt-4.2.0
         >=x11-libs/libXcomposite-0.4.0"
DEPEND="${RDEPEND}"

src_unpack() {
	unpack ${A}
}

src_compile() {
	if use debug; then
		QCFG="qt warn_on debug"
	else
		QCFG="qt warn_on release"
	fi
	echo "CONFIG += ${QCFG}" >> ${PROJ}.pro
	echo "target.path = ${D}/usr/bin" >> ${PROJ}.pro
	echo "INSTALLS += target" >> ${PROJ}.pro

	eqmake4 ${PROJ}.pro || die "eqmake4 failed"
	emake || die "emake failed"
}

src_install() {
	# Create a helper script because of the bizarre app name and because it
	# comes with no resources--WebHelper automatically fetches everything.
	cat > xqde <<-EOF
		#!/bin/sh
		${PROJ} --loadplugin WebHelper "$@"
	EOF
	fperms 0755 xqde
	dobin xqde

	emake install || die "make install failed"
}
