# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit vcs-snapshot

EGIT_COMMIT="eb2efc3eaec9a178c0f2049894417ca8c0b8bad4"

DESCRIPTION="C++ class library of cryptographic schemes"
HOMEPAGE="https://github.com/chfast/cryptopp"
SRC_URI="https://github.com/chfast/cryptopp/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include/cryptopp
	doins *.h
	dolib.a libcryptopp.a
	dodoc Readme.txt
}
