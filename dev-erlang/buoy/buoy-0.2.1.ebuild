# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit rebar

DESCRIPTION="High-Performance Erlang HTTP 1.1 Client"
HOMEPAGE="https://github.com/lpgauth/buoy"
SRC_URI="https://github.com/lpgauth/buoy/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	>=dev-erlang/foil-0.1.2
	>=dev-erlang/shackle-0.6.2
"
BDEPEND=""
