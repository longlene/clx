# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/text-wrapper/text-wrapper-1.000.ebuild,v 1.17 2006/08/06 03:13:36 mcummings Exp $

inherit perl-module

MY_P=txt2html-${PV}
S=${WORKDIR}/${MY_P}

DESCRIPTION="txt2html is a Perl program that converts plain text to HTML"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"
HOMEPAGE="http://txt2html.sourceforge.net/"

SLOT="0"
LICENSE="|| ( Artistic GPL-2 )"
KEYWORDS="~x86"
IUSE=""


DEPEND="dev-lang/perl
		dev-perl/Getopt-ArgvFile
		dev-perl/module-build
		"
RDEPEND="${DEPEND}"

#src_install() {
#	doman blib/bindoc/txt2html.1 
#}
