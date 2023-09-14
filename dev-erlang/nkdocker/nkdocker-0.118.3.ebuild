# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar

DESCRIPTION="Erlang Docker client"
HOMEPAGE="https://github.com/NetComposer/nkdocker"
SRC_URI="https://github.com/NetComposer/nkdocker/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-erlang/nkpacket
"
RDEPEND="${DEPEND}"
BDEPEND=""
