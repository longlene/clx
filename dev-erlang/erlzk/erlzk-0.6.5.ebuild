# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar

DESCRIPTION="A Pure Erlang ZooKeeper Client"
HOMEPAGE="https://github.com/huaban/erlzk"
SRC_URI="https://github.com/huaban/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

RDEPEND="
	>=dev-lang/erlang-17.1"
DEPEND="${RDEPEND}"

