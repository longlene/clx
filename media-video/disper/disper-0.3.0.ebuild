# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
inherit eutils multilib python

MY_PN="disper"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Disper is an on-the-fly display switch utility"
HOMEPAGE="http://willem.engen.nl/projects/disper/"
SRC_URI="http://ppa.launchpad.net/disper-dev/ppa/ubuntu/pool/main/d/disper/disper_${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="dev-lang/python"
RDEPEND="${DEPEND}"

S="${WORKDIR}"/dispercur
instdir="/usr/share/${PN}"

src_install() {
	emake DESTDIR="${D}" install || die "Install failed"
	doman ${PN}.1
	dodoc README TODO
}
