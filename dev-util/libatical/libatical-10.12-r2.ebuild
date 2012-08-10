# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-util/valgrind/valgrind-3.6.0.ebuild,v 1.1 2010/11/10 01:40:41 blueness Exp $

# http://aur.archlinux.org/packages/libatical/libatical/PKGBUILD

EAPI=3

DESCRIPTION="libatical shared objects"
HOMEPAGE="http://www.ati.amd.com"
SRC_URI="http://www2.ati.com/drivers/linux/ati-driver-installer-${PV/./-}-x86.x86_64.run"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
# IUSE="mpi"

DEPEND="!dev-util/catalyst"
RDEPEND="${DEPEND}"

RESTRICT="mirror strip"

_libaticaldir=${WORKDIR}/archive_files/arch/x86/usr/lib
[ "$ARCH" = "amd64" ] && _libaticaldir=${WORKDIR}/archive_files/arch/x86_64/usr/lib64

src_unpack() {
    /bin/sh ${DISTDIR}/ati-driver-installer-${PV/./-}-x86.x86_64.run --extract archive_files
}

src_install() {
    mkdir -p ${D}/usr/lib
    install -m755 ${_libaticaldir}/{libaticalcl.so,libaticaldd.so,libaticalrt.so} ${D}/usr/lib/
}
