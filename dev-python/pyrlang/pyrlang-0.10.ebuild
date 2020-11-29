# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 python3_6 )
inherit distutils-r1 vcs-snapshot

DESCRIPTION="Erlang node implemented in Python"
HOMEPAGE="https://pyrlang.github.io/Pyrlang/"
SRC_URI="https://github.com/Pyrlang/Pyrlang/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
