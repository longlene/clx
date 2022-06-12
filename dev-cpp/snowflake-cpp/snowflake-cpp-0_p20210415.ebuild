# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="20416444e0dc9778a16e25e146fdb37312f0186d"

DESCRIPTION="A C++ port of Twitter's Snowflake id generation algorithm"
HOMEPAGE="https://github.com/sniper00/snowflake-cpp"
SRC_URI="https://github.com/sniper00/snowflake-cpp/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	doins /usr/include
	doins snowflake.hpp
	dodoc README.md
}
