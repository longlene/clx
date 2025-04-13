# Copyright 2025 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
inherit distutils-r1

EGIT_COMMIT="d8b12828f8c9d117af45819f97702b82a43fdb0d"

DESCRIPTION="Erlang node implemented in Python"
HOMEPAGE="https://pyrlang.github.io/Pyrlang/"
SRC_URI="https://github.com/Pyrlang/Pyrlang/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/Pyrlang-${EGIT_COMMIT}
