# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="An improved themeing engine for Tk"
HOMEPAGE="http://tktable.sourceforge.net/tile/"
SRC_URI="mirror://sourceforge/tktable/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86"

IUSE="compat doc threads"

DEPEND="dev-lang/tcl
		dev-lang/tk"
RDEPEND=${DEPEND}

src_compile() {
	econf \
		$(use_enable compat) \
		$(use_enable threads) \
		|| die "econf failed"
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install \
	|| die "emake install failed"
        dodoc ANNOUNCE.txt README.txt ChangeLog license.terms
        if use doc; then
                docinto doc
                dohtml -r doc/html
                insinto /usr/share/doc/"${PF}"/doc/xml
                doins doc/xml/*
		docinstall doc \
			   demos \
			   demos/themes \
			   demos/themes/blue \
			   tools
	fi 
}

docinstall() {
	local i
	until [ -z "$1" ]; do 
		docinto "$1"
		for i in "$1"/*; do
	       		[ -f "${i}" ] && dodoc "${i}"
		done
	shift
        done
}                                                                                
