# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar

DESCRIPTION="Erlang Native UUID Generation"
HOMEPAGE="https://github.com/okeuday/uuid"
SRC_URI="https://github.com/okeuday/uuid/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-erlang/quickrand
"
RDEPEND="${DEPEND}"
BDEPEND=""
