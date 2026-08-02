# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="A ChatKit backend SDK"
HOMEPAGE="https://github.com/openai/chatkit-python https://pypi.org/project/openai-chatkit/"
SRC_URI="https://github.com/openai/chatkit-python/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/chatkit-python-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	dev-python/pydantic[${PYTHON_USEDEP}]
	dev-python/uvicorn[${PYTHON_USEDEP}]
	dev-python/openai[${PYTHON_USEDEP}]
	>=dev-python/openai-agents-0.3.2[${PYTHON_USEDEP}]
	>=dev-python/jinja2-3.1[${PYTHON_USEDEP}]
"

src_prepare() {
	# pyproject.toml is missing the [build-system] table required by PEP 517
	sed -i '1s/^/[build-system]\nrequires = ["setuptools"]\nbuild-backend = "setuptools.build_meta"\n\n/' \
		pyproject.toml || die
	default
}
