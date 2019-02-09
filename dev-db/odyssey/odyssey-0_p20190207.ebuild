# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils vcs-snapshot

EGIT_COMMIT="b7eeeed27ad8a999f4dd7d16f8ae79d2a1ab239d"

DESCRIPTION="Scalable PostgreSQL connection pooler"
HOMEPAGE="https://github.com/yandex/odyssey"
SRC_URI="https://github.com/yandex/odyssey/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-libs/openssl
"
RDEPEND="${DEPEND}"
BDEPEND=""
