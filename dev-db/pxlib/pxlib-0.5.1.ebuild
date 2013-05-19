# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="pxlib is a simply and still small C library to read and write
Paradox DB files."
HOMEPAGE="http://pxlib.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="gsf"

DEPEND="gsf? ( gnome-extra/libgsf )"

src_compile() {
	local myconf
	if use gsf ; then
		myconf="${myconf} --with-gsf"
	else
		myconf="${myconf} --without-gsf"
	fi
	
	econf ${myconf} || die "Could not configure"
	emake || die "Error building ${PN}"

	# Manually build the docs since it seems the autoconf system+Makefile
	# requires docbook-to-man and not docbook2man (which works slightly
	# different).  Additionally the sgml files seems to be broken, having
	# the page names in all upper case instead of case-sensitive (eg, PX_close).
	einfo "Building manpages"
	cd doc
	for i in *.sgml; do
		pagename=$(basename "$i" .sgml)
		ucase_pagename=$(echo "${pagename}" | tr '[:lower:]' '[:upper:]')
		sed -i -e "s:${ucase_pagename}:${pagename}:" "$i"
		/usr/bin/docbook2man "$i"
	done
}

src_install() {
	make install DESTDIR=${D}
	doman doc/px*.[1-8]
}
