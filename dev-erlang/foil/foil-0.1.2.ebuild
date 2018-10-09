# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rebar

DESCRIPTION="High-Performance Erlang Cache Compiler"
HOMEPAGE="https://github.com/lpgauth/foil"
SRC_URI="https://github.com/lpgauth/foil/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	>=dev-erlang/metal-0.1.1
"
RDEPEND="${DEPEND}"
BDEPEND=""
