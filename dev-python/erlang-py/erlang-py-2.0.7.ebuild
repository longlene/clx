# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11,12} )
inherit distutils-r1

DESCRIPTION="Erlang Binary Term Format for Python"
HOMEPAGE="https://github.com/okeuday/erlang_py"
SRC_URI="https://github.com/okeuday/erlang_py/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
