# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake vcs-snapshot

DESCRIPTION="A readline and libedit replacement"
HOMEPAGE="https://github.com/AmokHuginnsson/replxx"
SRC_URI="https://github.com/AmokHuginnsson/replxx/archive/release-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
