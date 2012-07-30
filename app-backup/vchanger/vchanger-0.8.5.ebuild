# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

DESCRIPTION="Vchanger emulates a magazine-based tape autoloader using disk partitions on fixed or removable disk drives as virtual magazines and files on those partitions as virtual tape volumes."
HOMEPAGE="http://sourceforge.net/projects/vchanger/"
SRC_URI="http://downloads.sourceforge.net/project/$PN/$PN/$PV/$P.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S=${WORKDIR}/${PN}

src_install() {
	emake DESTDIR=${D} install
}
