# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Admin shell script allowing faster dns lookups by reordering nameserver entries if the primary nameserver is down"
HOMEPAGE="http://reorder-ns.sourceforge.net/"
SRC_URI="mirror://sourceforge/reorder-ns/${PN}-${PV}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ia64 ~ppc ~sparc ~x86"
IUSE="logrotate"

RDEPEND="net-analyzer/nmap
	sys-apps/ifplugd
	sys-apps/sed"
DEPEND="${RDEPEND}
	logrotate? ( app-admin/logrotate )"

S="${WORKDIR}/${PN}"

src_install() {
	dosbin ${PN} || die "missing ${PN}"
	doman ${PN}.8
	dodoc INSTALL TODO
	if use logrotate; then
        	insinto /etc/logrotate.d
	        newins ${PN}.logrotate ${PN}
	fi
}
