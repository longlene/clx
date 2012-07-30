# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

SRC_VER="1.1.1"

inherit perl-module

DESCRIPTION="Perl extension to easily manage Cert REQUESTs"
SRC_URI="mirror://sourceforge/openca/openca-base-${SRC_VER}.tar.gz"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=">=dev-perl/X500-DN-0.27
	>=perl-core/Digest-MD5-2.14"
S="${WORKDIR}/openca-base-${SRC_VER}/src/modules/openca-req"

src_prepare() {
	perl-module_src_prepare

	sed -i -e /prova.pl/d "${S}"/MANIFEST || die "sed failed"
	einfo "editing MANIFEST"
	rm -r "${S}"/prova.pl || die "Not removed prova.pl"
	einfo "removed prova.pl"
}
