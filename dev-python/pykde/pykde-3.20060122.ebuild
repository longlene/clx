# Copyright 1999-2004 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header $

inherit eutils distutils

MY_PN="PyKDE"
MY_PV="20060122"
S="${WORKDIR}/${MY_PN}-snapshot${MY_PV}"

DESCRIPTION="set of Python bindings for the KDE libs"
# SRC_URI="http://www.river-bank.demon.co.uk/download/snapshots/${MY_PN}/${MY_PN}-snapshot${MY_PV}.tar.gz"
SRC_URI="http://www.riverbankcomputing.com/Downloads/${MY_PN}3/${MY_PN}-snapshot${MY_PV}.tar.gz"
HOMEPAGE="http://www.riverbankcomputing.co.uk/pykde/"

RESTRICT="nomirror"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~x86"
IUSE="debug doc kjs"

RDEPEND="virtual/libc
	virtual/python
	>=dev-python/sip-3.10.2
	>=dev-python/PyQt-3.12
	kde-base/kdelibs"

DEPEND="${RDEPEND}
	sys-devel/libtool"


src_compile() {
	cd ${S}
	distutils_python_version

	local myconf="-d /usr/lib/python${PYVER}/site-packages \
			-v /usr/share/sip \
			-k /usr/kde/3.4 \
			-c"

	use debug && myconf="${myconf} -r -u"
	use kjs && myconf="${myconf} -m"

	python configure.py ${myconf}
	emake || die
}

src_install() {
	einstall DESTDIR=${D} || die
	find ${D}/usr/share/sip -not -type d -not -iname *.sip -exec rm '{}' \;
	dodoc AUTHORS ChangeLog COPYING INSTALL NEWS README THANKS
	use doc && ( cp -r examples ${D}/usr/share/doc/${PF}
			cp -r templates ${D}/usr/share/doc/${PF}
			dohtml -r doc/* )
}
