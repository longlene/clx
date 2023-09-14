# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar vcs-snapshot

EGIT_COMMIT="35dbe556f84bc84e10527ecb0c98228815064d9d"

DESCRIPTION="A generic message buffer behaviour with pooling and back-pressure for Erlang/Elixir"
HOMEPAGE="https://github.com/cabol/gen_buffer"
SRC_URI="https://github.com/cabol/gen_buffer/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-erlang/epocxy
"
BDEPEND=""
