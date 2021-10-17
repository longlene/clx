# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rebar

DESCRIPTION="An erlang application for consuming, producing and manipulating json."
HOMEPAGE="https://github.com/talentdeficit/jsx"
SRC_URI="https://github.com/talentdeficit/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"


LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc src"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
