# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

DESCRIPTION="GKrellM2 plugin for showing current temperature and fan speed from sensors of g4"
HOMEPAGE="http://g4mon.beddamatrix.net/"
SRC_URI="http://g4mon.beddamatrix.net/getfile.php?name=sources/g4mon-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~ppc"
IUSE=""

S=${WORKDIR}/g4mon-${PV}

DEPEND=" >=x11-libs/gtk+-2.0
	=app-admin/gkrellm-2*"

src_install() {
	dodir /usr/lib/gkrellm2/plugins
	insinto /usr/lib/gkrellm2/plugins
	doins g4mon.so
	dodoc Changelog INSTALL README
}
