# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit rebar vcs-snapshot

EGIT_COMMIT="9dc56b0d236d5c4246960f6d4412c24739f52b64"

DESCRIPTION="Ordered fixed-size binary dictionary in Erlang"
HOMEPAGE="https://github.com/knutin/bisect"
SRC_URI="https://github.com/knutin/bisect/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-erlang/proper
"
RDEPEND="${DEPEND}"
BDEPEND=""
