# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

inherit java-pkg-2

SRC_URI="http://download.nexusformat.org/kits/${P}.tar.gz"
DESCRIPTION="Scientific algorithms library for Python"
HOMEPAGE="http://www.nexusformat.org/Main_Page"
LICENSE="LGPL"

SLOT="0"

IUSE="debug hdf hdf5 python xml"

KEYWORDS="~x86 ~amd64"

RDEPEND="virtual/jdk
         python? ( dev-lang/swig )
         hdf? ( sci-libs/hdf )
         hdf5? ( sci-libs/hdf5 )
         xml? ( >=dev-libs/mini-xml-2.2.2 )"


pkg_setup() {
        if use python && ! built_with_use dev-lang/swig python; then
                eerror "With python enabled you need"
                eerror "dev-lang/swig with python enabled"
                einfo  "Please re-emerge swig with USE=python"
                die "needs swig with python"
        fi
}

src_unpack() {
        unpack ${A}
        cd "${S}"
}

src_compile() {
        local myconf="--with-java-home=${JAVA_HOME}"
        use debug && myconf="${myconf} --enable-debug"
	use hdf && myconf="${myconf} --with-hdf=/usr"
        use hdf5 && myconf="${myconf} --with-hdf5=/usr"
        use python && myconf="${myconf} --with-python=/usr"
        use xml && myconf="${myconf} --with-xml=/usr"

        myconf="--prefix=/usr \
                --libdir=/usr/$(get_libdir) \
                ${myconf}"

	econf ${myconf} || die "configure failed"

        emake -j1 || die "emake failed"
}

src_install() {
        emake DESTDIR="${D}" \
                 install || die "Failed to install NeXus!"
}
