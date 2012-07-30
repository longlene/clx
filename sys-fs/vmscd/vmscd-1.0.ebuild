# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Utility that reads the contents of any OpenVMS CD-ROM or more generally any ODS-2 disk volume."
HOMEPAGE="http://www.suse.de/~kkaempf/vmscd/"
SRC_URI="http://www.suse.de/~kkaempf/vmscd/${P}.tar.bz2"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=""
RDEPEND=""

src_install() {
	make ROOT="${D}" install || die
	}
