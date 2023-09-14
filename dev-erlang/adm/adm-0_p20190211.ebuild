# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar vcs-snapshot

EGIT_COMMIT="e19fda9855c7300f388bd774a189a35eef4e9f91"

DESCRIPTION="Administration Dashboard"
HOMEPAGE="https://github.com/synrc/adm"
SRC_URI="https://github.com/synrc/adm/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-erlang/active
	dev-erlang/erlydtl
	dev-erlang/nitro
	dev-erlang/cowboy
	dev-erlang/n2o
	dev-erlang/bpe
"
BDEPEND=""
