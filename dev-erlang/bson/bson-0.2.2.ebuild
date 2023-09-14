# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar

MY_PN=bson-erlang

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="https://github.com/comtihon/bson-erlang/archive/v0.2.2.tar.gz -> ${MY_PN}-${PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/${MY_PN}-${PV}"
