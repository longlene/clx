# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=standalone
# Upstream requires-python is >=3.12,<3.14
PYTHON_COMPAT=( python3_12 python3_13 )

inherit distutils-r1

DESCRIPTION="Wrapper distribution bundling the NeMo Platform Python packages"
HOMEPAGE="
	https://pypi.org/project/nemo-platform/
	https://github.com/NVIDIA-NeMo/nemo-platform
"
# The nemo-platform wheel is a generated wrapper distribution (hatch
# force-include bundling ~30 sub-packages, built by the upstream release
# workflow), so package the official PyPI wheel directly. The GitHub repo
# NVIDIA-NeMo/nemo-helix is this project's monorepo (root pyproject is a
# uv dev environment, not the distribution).
WHL="nemo_platform-${PV}-py3-none-any.whl"
SRC_URI="
	https://files.pythonhosted.org/packages/75/fd/c01a9ca2d007748fa3c9bb2b1bf9ed93b65c82dd1de2096cbc014b37f93d/${WHL}
"
S="${WORKDIR}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RESTRICT="test"

python_compile() {
	distutils_wheel_install "${BUILD_DIR}/install" "${DISTDIR}/${WHL}"
}
