# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit rebar vcs-snapshot

EGIT_COMMIT="50e2011daaaf8de116af906a0708b3359ede04bc"

DESCRIPTION="The core Nitrogen library"
HOMEPAGE="https://github.com/nitrogen/nitrogen_core"
SRC_URI="https://github.com/nitrogen/nitrogen_core/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-erlang/rekt
	dev-erlang/stacktrace_compat
"
RDEPEND="${DEPEND}"
BDEPEND=""
