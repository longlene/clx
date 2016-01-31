# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Docker implemented in 100 lines of bash"
HOMEPAGE="https://www.p8952.info/projects.html"
SRC_URI="mirror://github/p8952/bocker/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
sys-fs/btrfs-progs
net-misc/curl
sys-apps/iproute2
net-firewall/iptables
dev-libs/libcgroup
>=sys-apps/util-linux-2.25.2
sys-apps/coreutils
"

src_install() {
	dobin bocker
	dodoc README.md
}
