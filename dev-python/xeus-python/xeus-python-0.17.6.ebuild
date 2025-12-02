# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{13..14} )

inherit cmake python-any-r1

DESCRIPTION="Jupyter kernel for the Python programming language"
HOMEPAGE="https://github.com/jupyter-xeus/xeus-python"
SRC_URI="https://github.com/jupyter-xeus/xeus-python/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	>=dev-cpp/xeus-zmq-3.1
	>=dev-cpp/nlohmann_json-3.11.3
	>=dev-cpp/pybind11_json-0.2.8
	>=dev-python/pybind11-2.6.1
	>=dev-python/pygments-2.3.1
	>=dev-python/debugpy-1.1.0
	>=dev-python/xeus-python-shell-0.6.3.0
"
RDEPEND="${DEPEND}"
BDEPEND=""
