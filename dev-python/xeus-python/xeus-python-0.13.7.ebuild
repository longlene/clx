# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_8 )
inherit cmake python-any-r1

DESCRIPTION="Jupyter kernel for the Python programming language"
HOMEPAGE="https://github.com/jupyter-xeus/xeus-python"
SRC_URI="https://github.com/jupyter-xeus/xeus-python/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-cpp/xtl
"
RDEPEND="${DEPEND}"
BDEPEND=""
