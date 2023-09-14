# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar vcs-snapshot

EGIT_COMMIT="365bb3b6cffde1b4da7109ed2594a0a3f1a4a949"

DESCRIPTION="Simple and flexible database wrapper for Erlang"
HOMEPAGE="https://github.com/cabol/cross_db"
SRC_URI="https://github.com/cabol/cross_db/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-erlang/iso8601
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -i 's#erlang:get_stacktrace()#[]#' src/xdb_lib.erl
}
