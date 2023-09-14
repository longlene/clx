# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit vcs-snapshot

MY_P=${P/_p/-}

DESCRIPTION="speech-recognition scoring software"
HOMEPAGE="http://www.openslr.org/4/"
SRC_URI="ftp://jaguar.ncsl.nist.gov/pub/${MY_P}-1312Z.tar.bz2"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"/${MY_P}-1312Z/

src_configure() {
	emake PREFIX="${D}"usr config
}

src_install() {
	dodir /usr/bin
	emake install
}
