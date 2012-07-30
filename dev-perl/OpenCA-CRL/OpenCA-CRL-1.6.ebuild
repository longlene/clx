# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

SRC_VER="1.1.1"

inherit perl-module eutils

DESCRIPTION="Perl extension to easily manage Certificate revocation list"
SRC_URI="mirror://sourceforge/openca/openca-base-${SRC_VER}.tar.gz"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64 x86"
IUSE=""

DEPEND=""
RDEPEND=""
S="${WORKDIR}/openca-base-${SRC_VER}/src/modules/openca-crl"

src_prepare() {
	perl-module_src_prepare

	sed -i -e /prova.pl/d "${S}"/MANIFEST || die "sed failed"
	einfo "editing MANIFEST"
	rm -r "${S}"/prova.pl || die "Not removed prova.pl"
	einfo "removed prova.pl"
}
