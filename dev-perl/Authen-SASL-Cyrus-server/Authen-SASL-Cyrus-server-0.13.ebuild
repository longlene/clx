# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/Authen-SASL/Authen-SASL-2.10.ebuild,v 1.8 2006/10/20 18:51:17 kloeri Exp $

inherit perl-module

DESCRIPTION="A Perl SASL interface using the Cyrus SASL library (server version)"
AUTHOR="PBOETTCH"
MY_P="${P//-server-/-}-server"
HOMEPAGE="http://search.cpan.org/~${AUTHOR}/${MY_P}/"
SRC_URI="mirror://cpan/authors/id/${AUTHOR:0:1}/${AUTHOR:0:2}/${AUTHOR}/${MY_P}.tar.gz"
S="${WORKDIR}/${MY_P}"

LICENSE="UNKNOWN"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

SRC_TEST="do"

export OPTIMIZE="$CFLAGS"
DEPEND=">=dev-perl/Authen-SASL-2.06 >=dev-libs/cyrus-sasl-2"
RDEPEND="${DEPEND} !dev-perl/Authen-SASL-Cyrus"

myconf="INC=-I/usr/include/sasl LIBS=-lsasl2 DEFINE=-DSASL2"
