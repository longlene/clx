# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit rebar

DESCRIPTION="Webmachine for Zotonic and Cowboy"
HOMEPAGE="https://github.com/zotonic/cowmachine"
SRC_URI="https://github.com/zotonic/cowmachine/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	>=dev-erlang/lager-3.6.1
	>=dev-erlang/zotonic_stdlib-1.0.0
	>=dev-erlang/cowboy-2.3.0
"
RDEPEND="${DEPEND}"
BDEPEND=""
