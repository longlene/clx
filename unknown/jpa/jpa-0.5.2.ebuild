# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Weblog Publisher Assistant"
HOMEPAGE="http://jpa.berlios.de/"
SRC_URI="http://download.berlios.de/jpa/${P}.tar.gz"
LICENSE="GPL"
SLOT="0"
KEYWORDS="~x86"
DEPEND=">=dev-lang/python-2.4
		dev-python/pygtk
		>=dev-python/sqlobject-0.7
		>=app-text/gtkspell-2.0
		>=dev-python/elementtree-1.2"

src_compile() {
# There is no need to compile anything, since JPA is written in an interpreted
# language. Only a startup script and a desktop entry need to be created, since
# they don't come with the source.

	cat > bin/jpa <<EOF
#!/bin/sh
cd /usr/share/jpa
python bin/jpa.py "\$@"
EOF
	chmod 755 bin/jpa
	mkdir -p share/applications
	cat > share/applications/jpa.desktop <<EOF
[Desktop Entry]
Encoding=UTF-8
Name=JPA
GenericName=Weblog publishing assistant
Comment=Write your blog in lightweight markup
Exec=jpa
Terminal=False
Type=Application
Icon=darkbeer.xpm
Categories=Application;Network;
StartupNotify=true
EOF
}

src_install() {
	# There's no Makefile for JPA, and there's no installation script,
	# so we're just copying all the needed files into desired locations.
	mkdir -p "${D}/usr/share/jpa"
	cp -r bin doc lib share src "${D}/usr/share/jpa"
	dobin bin/jpa
	insinto /usr/share/pixmaps
	doins share/images/darkbeer.xpm
	insinto /usr/share/applications
	doins share/applications/jpa.desktop
}
