# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils vcs-snapshot

EGIT_COMMIT="2ad8d03a2317ae7509113c417ffb2a052c58564d"

DESCRIPTION="modern c++, cross-platform, header-only, easy to use http framework"
HOMEPAGE="https://github.com/qicosmos/cinatra"
SRC_URI="https://github.com/qicosmos/cinatra/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	|| ( dev-libs/boost[context,threads] dev-libs/asio )
"
RDEPEND="${DEPEND}"
