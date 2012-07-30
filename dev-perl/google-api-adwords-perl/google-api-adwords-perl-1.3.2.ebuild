# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit perl-module

DESCRIPTION="Google AdWords API Perl Client"
HOMEPAGE="http://code.google.com/p/google-api-adwords-perl/"
SRC_URI="http://google-api-adwords-perl.googlecode.com/files/awapi_perl_lib_1.3.2.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-perl/Typemap
	dev-perl/Cache
	dev-perl/Text-Patch
	dev-perl/XML-Parser
	dev-perl/Template-Toolkit
	dev-perl/TermReadKey"

DEPEND="${RDEPEND}
	virtual/perl-Module-Build"

S=${WORKDIR}/${PN}
