# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit vcs-snapshot

EGIT_COMMIT="bd38559fedcdfded4d9acbcbf988e4a8f5057eeb"

DESCRIPTION="An IRCd for unified networks"
HOMEPAGE="https://github.com/solanum-ircd/solanum"
SRC_URI="https://github.com/solanum-ircd/solanum/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	./autogen.sh
}
