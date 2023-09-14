# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar

DESCRIPTION="supervisor and manager for Erlang/Elixir processes"
HOMEPAGE="https://github.com/Pouriya-Jahanbakhsh/director"
SRC_URI="https://github.com/Pouriya-Jahanbakhsh/director/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
