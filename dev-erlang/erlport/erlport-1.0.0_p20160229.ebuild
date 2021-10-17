# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rebar vcs-snapshot

EGIT_COMMIT="246b7722d62b87b48be66d9a871509a537728962"

DESCRIPTION="ErlPort - connect Erlang to other languages"
HOMEPAGE="https://github.com/hdima/erlport"
SRC_URI="https://github.com/hdima/erlport/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -i 's#erlang:get_stacktrace()#[]#' src/erlport.erl
}
