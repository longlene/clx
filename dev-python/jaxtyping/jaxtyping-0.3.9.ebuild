# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Type annotations and runtime checking for shape and dtype of JAX/NumPy/PyTorc"
HOMEPAGE="
	https://pypi.org/project/jaxtyping/
	https://github.com/patrick-kidger/jaxtyping
"
SRC_URI="https://github.com/patrick-kidger/jaxtyping/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/wadler-lindig-0.1.3[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
