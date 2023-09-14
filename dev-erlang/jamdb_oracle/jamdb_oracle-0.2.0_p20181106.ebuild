# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar vcs-snapshot

EGIT_COMMIT="b3b58c7336d95990dfb460907a37332d4e76c4e0"

DESCRIPTION="Oracle Database driver for Erlang"
HOMEPAGE="https://github.com/erlangbureau/jamdb_oracle"
SRC_URI="https://github.com/erlangbureau/jamdb_oracle/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	>=dev-erlang/jose-1.8.0
"
RDEPEND="${DEPEND}"
BDEPEND=""
