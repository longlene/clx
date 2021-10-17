# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit vcs-snapshot

EGIT_COMMIT="7b95200eba3406b5f05bdfe5b2090bfc164c60c0"

DESCRIPTION="Stores your data in ICMP ping packets"
HOMEPAGE="https://github.com/yarrick/pingfs"
SRC_URI="https://github.com/yarrick/pingfs/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dosbin pingfs
	dodoc README.md
}
