# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Detect and protect PII through context-aware replacement and rewriting"
HOMEPAGE="https://github.com/NVIDIA-NeMo/Anonymizer https://nvidia-nemo.github.io/Anonymizer/latest/"
SRC_URI="https://github.com/NVIDIA-NeMo/Anonymizer/archive/refs/tags/v${PV}.tar.gz
	-> ${P}.gh.tar.gz"
S="${WORKDIR}/Anonymizer-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/pydantic-2.9[${PYTHON_USEDEP}]
		>=dev-python/cyclopts-3[${PYTHON_USEDEP}]
		>=dev-python/pygments-2.18[${PYTHON_USEDEP}]
		>=dev-python/cryptography-46.0.6[${PYTHON_USEDEP}]
		>=dev-python/httpx-0.27.0[${PYTHON_USEDEP}]
		>=dev-python/tiktoken-0.9.0[${PYTHON_USEDEP}]
	')
"
DEPEND="${RDEPEND}"
BDEPEND="
	$(python_gen_cond_dep '
		dev-python/uv-dynamic-versioning[${PYTHON_USEDEP}]
	')
"

src_prepare() {
	# Inject static version — uv-dynamic-versioning reads git tags (absent in tarball)
	sed -i \
		-e 's/^dynamic = \["version"\]/version = "'"${PV}"'"/' \
		pyproject.toml || die
	default
}
