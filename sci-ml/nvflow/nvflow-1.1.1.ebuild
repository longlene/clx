# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12..15} )

inherit distutils-r1

DESCRIPTION="Workflow orchestration for SDG, SFT, and evaluation pipelines"
HOMEPAGE="https://github.com/NVIDIA/nvflow"
SRC_URI="https://github.com/NVIDIA/nvflow/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="$(python_gen_cond_dep '
	>=dev-python/jsonlines-4.0.0[${PYTHON_USEDEP}]
	dev-python/nemo-skills[${PYTHON_USEDEP}]
	>=dev-python/omegaconf-2.3.0[${PYTHON_USEDEP}]
	>=dev-python/rich-13.0.0[${PYTHON_USEDEP}]
	>=dev-python/typer-0.9.0[${PYTHON_USEDEP}]
')"

BDEPEND="
	dev-python/hatch-vcs
"

src_prepare() {
	# Inject version for hatch-vcs — git history is unavailable in portage sandbox
	export SETUPTOOLS_SCM_PRETEND_VERSION="${PV}"

	# Replace git-pinned nemo-skills dep with a plain package reference so the
	# wheel metadata uses a resolvable atom instead of a git URL
	sed -i \
		's|"nemo-skills @ git+https://github.com/NVIDIA/NeMo-Skills.git@[a-f0-9]*",|"nemo-skills",|' \
		pyproject.toml || die "Failed to patch nemo-skills git dep"

	distutils-r1_src_prepare
}
