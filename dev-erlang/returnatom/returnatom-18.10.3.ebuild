# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="Erlang library for creating dynamic modules that their functions always yield atom type"
HOMEPAGE="https://github.com/Pouriya-Jahanbakhsh/returnatom"
SRC_URI="https://github.com/Pouriya-Jahanbakhsh/returnatom/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
