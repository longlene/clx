# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit eutils

DESCRIPTION="XPaint image editor with tiff, jpeg and png support."
HOMEPAGE="http://sf-xpaint.sourceforge.net/"
SRC_URI="mirror://sourceforge/sf-xpaint/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND=">=media-libs/tiff-3.2
	app-editors/nedit
	virtual/jpeg
	media-libs/libpng
	sys-libs/zlib
	x11-libs/libXmu
	x11-libs/libXft
	net-print/cups
	>=app-text/gv-3.7
	>=media-gfx/imagemagick-6.7
	>=media-libs/freetype-2.4.7
	>=media-libs/libpgf-6
	>=media-libs/openjpeg-1.4
	>=x11-libs/libXpm-3.5"
DEPEND="${RDEPEND}
	sys-devel/flex
	sys-devel/bison"

src_configure() {
	# Change Local.config to use nedit for editing. Sadly, xpaint
	# hardcodes the EDITOR variable into a system() call when calling an
	# external editor, so the same editor must be available at both compile
	# and run time. The default is emacs, which is a heavyweight package
	# and needs a terminal window to launch in.
	# nedit is lighter weight and matches the xpaint GUI rather well.
	# If another choice is desired, change the RDEPEND and 'nedit' below.
	sed -i -e 's/^EDITOR =.*/EDITOR = nedit/g' Local.config

	# Support CFLAGS and LDFLAGS
	# This adds them to the top makefile
	echo "CDEBUGFLAGS = ${CFLAGS}" >> Local.config
	echo "CXXDEBUGFLAGS = ${CXXFLAGS}" >> Local.config
	echo "LOCAL_LDFLAGS = ${LDFLAGS}" >> Local.config

	# This adds CFLAGS and LDFLAGS to the pgf2pnm program's hardcoded Makefile
	sed -i -e 's:\$(CPP) -c:\$(CPP) ${CXXFLAGS} -c:g' rw/pgf-util/Makefile
	sed -i -e 's:\$(CPP) -o:\$(CPP) ${LDFLAGS} -o:g' rw/pgf-util/Makefile

	# XPaint uses a crude configure script that looks like autoconf, but isn't.
	# This forces it to use its internal Xaw3dxft library, which seems to
	# be the only library it actually compiles with.
	./configure xaw3dxft.so

	# The Makefiles live. Now it's time to fix them. 
	# This adds LDFLAGS to the Xaw3dxft library.
	sed -i -e 's:SHLIBGLOBALSFLAGS:LDFLAGS:g' Xaw3dxft/Makefile

	# The imgmerge script is full of dependencies. Don't let the Makefile
	# install it in the system bin directory.  We'll stuff it later into
	# the XPaint bin directory. The user can then run it at their own risk.
	sed -i -e 's/^.*imgmerge*/\#&/g' Makefile

	# And last but not least, pdfconcat. This is a crazy C program that 
	# actually contains the compiler command line in a define statement
	# at the top of the source, which is then executed by calling the source
	# file as a shell script. Wonderful obfuscation. Don't even try to fix
	# this sucker; bury it deep and let the user dig it up if desired.
	sed -i -e 's/sh pdfconcat\.c/\#&/' Makefile
	sed -i -e 's/install -c pdfconcat/\#&/' Makefile
}

src_compile() {
	# Fails occasionally in parallel mode when flex/bison gets behind
	# the compiler.
	emake -j1
}

src_install() {
	emake DESTDIR=${D} install
	emake DESTDIR=${D} install.man

	# This copies the bundled Xaw3dxft library files to the proper place.
	dolib.so Xaw3dxft/libXaw3dxft.so*

	# Copy the imgmerge script to the XPaint shared bin directory, and
	# the pdfconcat file to the Doc directory, where they'll be mostly 
	# harmless.
	cp share/bin/imgmerge  ${D}/usr/share/${PN}/bin/
	dodoc INSTALL README README.old README.PNG TODO ChangeLog
	dodoc Doc/Operator.doc Doc/TextFormat.doc Doc/sample.Xdefaults
	dodoc Xaw3dxft/README.XAW3DXFT imgmerge.man pdfconcat.c pdfconcat.man

	# Other distributions distribute Xaw3dxft as an 'xpaint-devel' package. 
	# This should be enabled/disabled with a USE flag. Until then, allow
	# the user to program like it's 1995.
	mkdir -p ${D}/usr/include/X11/Xaw3dxft
	cp -L Xaw3dxft/exports/include/X11/Xaw3dxft/*.h \
	  ${D}/usr/include/X11/Xaw3dxft/

	doicon icons/${PN}.svg
	newicon icons/XPaintIcon_alpha_48x48.png xpaint.png
	make_desktop_entry xpaint "XPaint" /usr/share/pixmaps/xpaint.svg
}

