# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

WORLD_COMMIT="8d79b88b7dd92e8a132996cf74080b2d6f881b98"

DESCRIPTION="A Python wrapper for the high-quality vocoder World"
HOMEPAGE="
	https://pypi.org/project/pyworld/
	https://github.com/JeremyCCHsu/Python-Wrapper-for-World-Vocoder
"
SRC_URI="
	https://github.com/JeremyCCHsu/Python-Wrapper-for-World-Vocoder/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
	https://github.com/mmorise/World/archive/${WORLD_COMMIT}.tar.gz -> world-${WORLD_COMMIT}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/numpy[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

S="${WORKDIR}"/Python-Wrapper-for-World-Vocoder-${PV}

src_prepare() {
	default
	rmdir lib/World && ln -sv "${WORKDIR}"/World-${WORLD_COMMIT} lib/World
	distutils-r1_src_prepare
}
