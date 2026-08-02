# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

MY_PV="0.1.3-rc0"

DESCRIPTION="Public plugin contract for the NeMo Platform"
HOMEPAGE="https://github.com/NVIDIA-NeMo/nemo-platform"
SRC_URI="https://github.com/NVIDIA-NeMo/nemo-platform/archive/refs/tags/${MY_PV}.tar.gz -> nemo-platform-0.1.3_rc0.gh.tar.gz"

S="${WORKDIR}/nemo-platform-${MY_PV}/packages/nemo_platform_plugin"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/anthropic-0.88.0[${PYTHON_USEDEP}]
	>=dev-python/fastapi-0.115.4[${PYTHON_USEDEP}]
	>=dev-python/lark-1.1.0[${PYTHON_USEDEP}]
	sci-ml/nemo-platform-sdk[${PYTHON_USEDEP}]
	>=dev-python/openai-1.109.1[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.10.3[${PYTHON_USEDEP}]
	>=dev-python/pydantic-settings-2.8.1[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-6.0.2[${PYTHON_USEDEP}]
	>=dev-python/typer-0.20.0[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/hatchling[${PYTHON_USEDEP}]
"
RESTRICT="test"

src_prepare() {
	sed -i '/from nmp_build_tools/d' hatch_build.py || die
	sed -i '/apply_bundle_force_include/d' hatch_build.py || die
	sed -i '/rewrite_bundled_dependencies_in_wheel/d' hatch_build.py || die
	distutils-r1_src_prepare
}
