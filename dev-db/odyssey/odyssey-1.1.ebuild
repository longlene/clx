# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake vcs-snapshot

DESCRIPTION="Scalable PostgreSQL connection pooler"
HOMEPAGE="https://github.com/yandex/odyssey"
SRC_URI="https://github.com/yandex/odyssey/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-libs/openssl
"
RDEPEND="${DEPEND}"
BDEPEND=""
