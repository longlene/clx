# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="27bae6b7f6ae2bc6d79f54f0722927977b3bacc5"

DESCRIPTION="Machine Learning Model Server"
HOMEPAGE="https://github.com/redislabsmodules/redis-ml"
SRC_URI="https://github.com/redislabsmodules/redis-ml/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	virtual/cblas
"
RDEPEND="${DEPEND}"
