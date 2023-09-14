# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 eutils

DESCRIPTION="Common Lisp bindings to the SDL graphics library, and OpenGL libraries"
HOMEPAGE="http://cl-sdl.sourceforge.net/"
SRC_URI="mirror://sourceforge/cl-sdl/${PN}_${PV}.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc x86 ~arm"
IUSE=""
DEPEND="dev-lisp/cl-uffi
	media-libs/libsdl
	media-libs/sdl-ttf
	media-libs/sdl-mixer
	media-libs/sdl-image
	virtual/opengl"

S=${WORKDIR}/${PN}

SUB_PACKAGES="sdl sdl-ttf sdl-img sdl-mix opengl"
CLPACKAGE="sdl-ffi sdl-demos ${SUB_PACKAGES}"

src_unpack() {
	unpack ${A}
	epatch ${FILESDIR}/${PV}-CD-STATUS-gentoo.patch || die
}

src_compile() {
	make clean
	make || die
}

src_install() {
	insinto /usr/lib/cl-sdl
	doins build/*.so

	dodir /usr/share/common-lisp/systems/

	insinto /usr/share/common-lisp/source/sdl-ffi/ffi
	doins ffi/uffi.lisp
	insinto /usr/share/common-lisp/source/sdl-ffi
	doins sdl-ffi.asd
	dosym /usr/share/common-lisp/source/sdl-ffi/sdl-ffi.asd \
		/usr/share/common-lisp/systems/sdl-ffi.asd

	insinto /usr/share/common-lisp/source/sdl-demos/examples/nehe
	doins examples/nehe/*.lisp
	insinto /usr/share/common-lisp/source/sdl-demos/examples
	doins examples/*.lisp
	insinto /usr/share/common-lisp/source/sdl-demos
	doins sdl-demos.asd

	insinto /usr/share/common-lisp/source/sdl-ffi
	doins sdl-ffi.asd

	dodir /usr/share/common-lisp/systems

	dosym /usr/share/common-lisp/source/sdl-demos/sdl-demos.asd \
		/usr/share/common-lisp/systems/sdl-demos.asd

	for i in ${SUB_PACKAGES} ; do
		# install lisp
		insinto /usr/share/common-lisp/source/$i/$i
		doins $i/*.lisp
		insinto /usr/share/common-lisp/source/$i
		doins $i.asd
		# install system
		dosym /usr/share/common-lisp/source/$i/$i.asd \
			/usr/share/common-lisp/systems/$i.asd
	done

	insinto /usr/share/cl-sdl-demos/data
	doins examples/data/cl-sdl.bmp examples/data/cl-sdl.xcf \
		examples/data/star.bmp examples/data/tut10.world

	dodoc LICENSE README STYLE
}
