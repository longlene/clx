# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit perl-app

DESCRIPTION="parses Youtube feeds (playlists, favorite lists, user upload lists)"
HOMEPAGE="http://code.google.com/p/umph/"
SRC_URI="http://umph.googlecode.com/files/umph-0.2.0.tar.gz
	http://umph.googlecode.com/files/Umph-Prompt-0.1.0.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-perl/XML-DOM
	dev-perl/XML-RegExp"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i 's-url => $l-url => @{[map { s/\&.*//; $_ } $l]}-' bin/umph || die
}

src_install() {
	perl-module_src_install
	insinto ${VENDOR_LIB}/Umph
	doins ../Umph-Prompt-*/lib/*/*.pm || die
}
