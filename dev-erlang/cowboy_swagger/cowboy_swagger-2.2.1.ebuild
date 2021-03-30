# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit rebar

DESCRIPTION="Swagger integration for Cowboy"
HOMEPAGE="https://github.com/inaka/cowboy_swagger"
SRC_URI="https://github.com/inaka/cowboy_swagger/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	>=dev-erlang/jsx-2.9.0
	>=dev-erlang/cowboy-2.3.0
	>=dev-erlang/ranch-1.4.0
	>=dev-erlang/trails-2.1.0
"
BDEPEND=""
