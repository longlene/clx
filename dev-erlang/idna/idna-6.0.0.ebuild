# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit rebar vcs-snapshot

DESCRIPTION="Erlang IDNA lib"
HOMEPAGE="https://github.com/benoitc/erlang-idna"
SRC_URI="https://github.com/benoitc/erlang-idna/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-erlang/unicode_util_compat
"
BDEPEND=""

src_prepare() {
	default
	#sed -i 's#0.3.1#0.4.1#' rebar.config
	rm rebar.config.script
}
