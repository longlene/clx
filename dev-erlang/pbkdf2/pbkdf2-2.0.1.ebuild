# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rebar

DESCRIPTION="A PBKDF2 implementation for Erlang"
HOMEPAGE="https://github.com/basho/erlang-pbkdf2"
SRC_URI="https://github.com/basho/erlang-pbkdf2/archive/${PV}.tar.gz -> erlang-${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/erlang-${P}"
