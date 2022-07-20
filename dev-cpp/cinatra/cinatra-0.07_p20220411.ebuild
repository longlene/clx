# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake vcs-snapshot

EGIT_COMMIT="573f80cd56bc98fadb6fa7088600af01d353deda"

DESCRIPTION="modern c++, cross-platform, header-only, easy to use http framework"
HOMEPAGE="https://github.com/qicosmos/cinatra"
SRC_URI="https://github.com/qicosmos/cinatra/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	|| ( dev-libs/boost[context] dev-libs/asio )
"
RDEPEND="${DEPEND}"
