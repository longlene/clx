# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A minimal library for building saclable TCP servers in Erlang"
HOMEPAGE="https://github.com/sinasamavati/condor"
SRC_URI="https://github.com/sinasamavati/condor/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

RDEPEND="
	>=dev-lang/erlang-17.1
"
DEPEND="${RDEPEND}"

src_install() {
	insinto /usr/lib/erlang/lib/${P}
	doins -r ebin
	dodoc README.org
}
