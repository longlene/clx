# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rebar vcs-snapshot

DESCRIPTION="A library to consistently crypto-hash Erlang Terms"
HOMEPAGE="https://gitlab.com/barrel-db/ehash/"
SRC_URI="https://gitlab.com/barrel-db/ehash/-/archive/${PV}/ehash-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
