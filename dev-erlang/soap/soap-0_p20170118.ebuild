# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar vcs-snapshot

EGIT_COMMIT="856b5c418d8d40a6b5bcbbe3fd390c6a0b8d4f18"

DESCRIPTION="Erlang SOAP support"
HOMEPAGE="https://github.com/bet365/soap"
SRC_URI="https://github.com/bet365/soap/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	>=dev-erlang/erlsom-1.4.0
"
BDEPEND=""
