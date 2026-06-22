# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{10..14} )

inherit distutils-r1

DESCRIPTION="Automatically decrypt encryptions, decode encodings, and crack hashes"
HOMEPAGE="https://github.com/bee-san/Ciphey"
SRC_URI="https://github.com/bee-san/Ciphey/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/Ciphey-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/appdirs-1.4.4[${PYTHON_USEDEP}]
		>=dev-python/base58-2.0.1[${PYTHON_USEDEP}]
		>=dev-python/click-7.1.2[${PYTHON_USEDEP}]
		>=dev-python/flake8-3.8.2[${PYTHON_USEDEP}]
		>=dev-python/loguru-0.5.0[${PYTHON_USEDEP}]
		>=dev-python/pylint-2.5.2[${PYTHON_USEDEP}]
		>=dev-python/pyyaml-5.3.1[${PYTHON_USEDEP}]
		dev-python/rich[${PYTHON_USEDEP}]
		>=dev-python/yaspin-0.17[${PYTHON_USEDEP}]
		dev-python/base91[${PYTHON_USEDEP}]
		dev-python/cipheydists[${PYTHON_USEDEP}]
		dev-python/cipheycore[${PYTHON_USEDEP}]
		dev-python/click-spinner[${PYTHON_USEDEP}]
		dev-python/pybase62[${PYTHON_USEDEP}]
	')
"
BDEPEND="
	$(python_gen_cond_dep '
		dev-python/poetry-core[${PYTHON_USEDEP}]
	')
"

RESTRICT="test"
