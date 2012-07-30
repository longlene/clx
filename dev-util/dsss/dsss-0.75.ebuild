# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="the D Shared Software System"
HOMEPAGE="http://www.dsource.org/projects/dsss"
SRC_URI="http://svn.dsource.org/projects/dsss/downloads/${PV}/${P}.tar.bz2"

LICENSE="MIT"
SLOT="0"
KEYWORDS="x86 ~amd64"
IUSE=""

DEPEND="!dev-libs/phobos
	!dev-libs/tango"
RDEPEND=""

pkg_setup(){

	if [ "$(gcc-minor-version)" != "1" ]; then
		eerror "                                    "
		eerror "dsss must be compiled with gcc-4.1.2"
		eerror "Please use gcc-config to switch your"
		eerror "default compiler.                   "
		eerror "                                    "
		die "Required use of gcc-4.1.2!"
	fi
	if ! built_with_use =sys-devel/gcc-4.1.2 d; then
	           eerror "                                                 "
	           eerror "you need to compile sys-devel/gcc with d useflag "
	           eerror "                                                 "
	           die "No suitable D compiler found!"
	fi

}

src_compile(){

emake -j1 -f Makefile.gdc.posix || die "make failed"

}

src_install(){

./dsss install --prefix=${D}/usr/ --sysconfdir=${D}/etc/ \
--includedir=${D}/usr/include/d/ || die "install failed"

}

