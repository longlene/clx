# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-2

DESCRIPTION="Docker implemented in 100 lines of bash"
HOMEPAGE="https://www.p8952.info/projects.html"
#SRC_URI=""

EGIT_REPO_URI="https://github.com/p8952/bocker.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
sys-fs/btrfs-progs
sys-apps/iproute2
net-firewall/iptables
>=sys-apps/util-linux-2.25.2
"
