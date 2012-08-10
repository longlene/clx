# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit multilib

DESCRIPTION="high-level interface for low-level physics engines"
HOMEPAGE="http://opal.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}-src.zip"

LICENSE="|| ( BSD LGPL-2.1 )"
SLOT="0"
KEYWORDS="~x86"
IUSE="debug double-precision examples"

RDEPEND="dev-games/ode"
DEPEND="${RDEPEND}
	app-arch/unzip
	dev-util/scons"

S="${WORKDIR}/${P}-src"

src_compile() {
	local myconf
	if use double-precision; then
		myconf="double=true"
	fi
	if use debug ; then
		myconf="${myconf} debug=true"
	fi

	# the install flag just triggers moving around some files
	scons ODE ${myconf} install

	if use examples; then
		# fix examples
		sed -i \
			-e "s:ogre\/:OGRE\/:g" \
			samples/src/ExampleApplication.h \
			samples/src/ExampleFrameListener.h \
		|| die "sed samples failed"
		#clean up some directories
		rm -r samples/playpen/{vc71,vc8}
		rm -r samples/simple/{vc71,vc8}
	fi
}

src_install() {
	dolib build/posix/release/libopal-ode.so
	insinto /usr/include/opal
	doins build/posix/release/include/opal/*

	insinto /usr/$(get_libdir)/pkgconfig/
	doins /usr/opal.pc

	dodoc readme.txt

	if use examples ; then
		insinto /usr/share/doc/${PF}/samples
		doins -r samples/* || die "copying examples failed"
	fi
}
