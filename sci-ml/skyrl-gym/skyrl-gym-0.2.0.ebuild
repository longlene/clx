# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="RL environments for LLMs implemented with the Gymnasium API"
HOMEPAGE="https://github.com/NovaSky-AI/SkyRL"
SRC_URI="https://github.com/NovaSky-AI/SkyRL/archive/refs/tags/skyrl_gym-v${PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/SkyRL-skyrl_gym-v${PV}/skyrl-gym"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/func-timeout[${PYTHON_USEDEP}]
	dev-python/omegaconf[${PYTHON_USEDEP}]
	dev-python/pandas[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
"
RESTRICT="test"
