# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils flag-o-matic

DESCRIPTION="Scanner utility and SANE backend for Canon PIXMA MP series"
HOMEPAGE="http://home.arcor.de/wittawat/pixma/"

SRC_URI="${HOMEPAGE}/mp150-${PV}.tar.bz2"
#	${HOMEPAGE}/mp150-${PV}a.patch"
LICENSE="as-is"

SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="media-gfx/sane-backends media-libs/tiff"

src_unpack() {
	unpack mp150-${PV}.tar.bz2 || die
#	epatch ${DISTDIR}/mp150-${PV}a.patch || die # apply before changing directory structure
	mv mp150-${PV} ${P} || die # Correcting directory-structure
}

src_compile() {
	# The package doesn't contain any configure script! (?)
	# econf || die
	emake || die
}

src_install() {
	_libdir="usr/lib/sane/"
	_bindir="usr/local/bin/"
	mkdir -p "${D}${_bindir}" "${D}${_libdir}"
	install -D scan "${D}${_bindir}pixmascan" || die
	backenddir= install libsane-pixma.so "${D}${_libdir}libsane-pixma.so.1" || die

	#dllconf="${DESTDIR}/etc/sane.d/dll.conf"
	#temp=`grep pixma "$dllconf"`
	#if [ "$temp" != pixma ]; then
	#	einfo "Inserting the backend name 'pixma' into /etc/sane.d/dll.conf"
	#	echo pixma >> "$dllconf"
	#fi
}

pkg_postinst() {
	einfo ""
	einfo "Register this driver by"
	einfo "      'echo pixma >> /etc/sane.d/dll.conf'"
	einfo ""
	einfo "You might need to set the permission of the device node in"
	einfo "      /dev/bus/usb or /proc/bus/usb."
	einfo ""
	einfo "You can now run 'pixmascan' at the command line"
	einfo ""
}
