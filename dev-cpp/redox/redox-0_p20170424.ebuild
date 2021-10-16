# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake vcs-snapshot

EGIT_COMMIT="b5b9fa31a6fba3f7ce872e623958cb27b7686039"

DESCRIPTION="Modern, asynchronous, and wicked fast C++11 client for Redis"
HOMEPAGE="https://github.com/hmartiro/redox"
SRC_URI="https://github.com/hmartiro/redox/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-libs/hiredis
	dev-libs/libev
"
RDEPEND="${DEPEND}"
