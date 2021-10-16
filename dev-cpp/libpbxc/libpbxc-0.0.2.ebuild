# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake vcs-snapshot

DESCRIPTION="Message header defines and common utils"
HOMEPAGE="http://10.20.16.48/acct/libpbxc"
SRC_URI="http://10.20.16.48/acct/libpbxc/repository/archive.tar.gz?ref=v${PV} -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-libs/protobuf
"
RDEPEND="${DEPEND}"
