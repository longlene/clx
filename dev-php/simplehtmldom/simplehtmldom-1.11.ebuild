# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit php-lib-r1

EAPI=3

DESCRIPTION="PHP Simple HTML DOM Parser"
HOMEPAGE="http://simplehtmldom.sourceforge.net/"
SRC_URI="mirror://sourceforge/simplehtmldom/${P//[.-]/_}.zip"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}"

src_install() {
	php-lib-r1_src_install . *.php

	dohtml -r manual

	docinto examples
	dodoc example/*.php
	docinto examples/scraping
	dodoc example/scraping/*.php
}
