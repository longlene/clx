# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

DESCRIPTION="Monkeysphere allows you to use the OpenPGP Web of Trust to identify the servers you connect to and to prove your own identity to them"
HOMEPAGE="http://web.monkeysphere.info/"
MY_P=${P/-/_}
SRC_URI="http://archive.monkeysphere.info/debian/pool/monkeysphere/m/monkeysphere/${MY_P}.orig.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="debug"

DEPEND="app-crypt/gnupg
		net-misc/openssh
		dev-perl/Crypt-OpenSSL-RSA
		dev-perl/Crypt-OpenSSL-Bignum
		perl-core/Digest-SHA "
RDEPEND="${DEPEND}"

src_install() {
        emake  install DESTDIR="${D}" || die
}

