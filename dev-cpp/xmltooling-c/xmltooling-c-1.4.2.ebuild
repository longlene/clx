# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit eutils

DESCRIPTION="Internet2 lower-level library that provides a higher level interface to XML processing, particularly in light of signing and encryption."
HOMEPAGE="http://wiki.shibboleth.net/confluence/display/OpenSAML/XMLTooling-C"
SRC_URI="http://www.shibboleth.net/downloads/c++-opensaml/latest/xmltooling-${PV}.tar.gz"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

S=${WORKDIR}/xmltooling-${PV}

RDEPEND=">=dev-libs/xerces-c-3.0.0
	 >=dev-libs/log4shib-1.0
	 >=dev-libs/xml-security-c-1.6.0
	 net-misc/curl
	 dev-libs/openssl"

DEPEND="${RDEPEND}"

src_configure() {
	econf
}

src_install() {
	emake DESTDIR="${D}" install || die "Install failed"
}
