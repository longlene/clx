# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

MY_PN=mongodb-erlang

DESCRIPTION="MongoDB driver for Erlang"
HOMEPAGE="https://github.com/comtihon/mongodb-erlang"
SRC_URI="https://github.com/comtihon/mongodb-erlang/archive/v${PV}.tar.gz -> ${MY_PN}-${PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-erlang/bson
	dev-erlang/pbkdf2
	dev-erlang/poolboy
"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/${MY_PN}-${PV}"
