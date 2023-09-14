# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

DESCRIPTION="cnats C++ Wrapper"
HOMEPAGE="http://10.20.16.48/acct/cnatspp"
SRC_URI="http://10.20.16.48/acct/cnatspp/repository/archive.tar.gz?ref=v${PV} -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-libs/cnats
"
RDEPEND="${DEPEND}"
