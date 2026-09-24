# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{13..15} )

inherit python-single-r1

COMMIT="cba802df081985141eeee36803685775c183a047"

DESCRIPTION="A lightweight library for xPU kernel JIT compilation"
HOMEPAGE="https://github.com/deepseek-ai/DeepJIT"
SRC_URI="https://github.com/deepseek-ai/DeepJIT/archive/${COMMIT}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/DeepJIT-${COMMIT}"

# Upstream carries no LICENSE file and the GitHub API reports no license set.
LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
RESTRICT="mirror"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="
	${PYTHON_DEPS}
	dev-libs/elfutils
	sci-ml/pytorch[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/pybind11[${PYTHON_USEDEP}]
	')
"
DEPEND="${RDEPEND}"

src_install() {
	insinto /usr/include
	doins -r include/deep_jit
}
