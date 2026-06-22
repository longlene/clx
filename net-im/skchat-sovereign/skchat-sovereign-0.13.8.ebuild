# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1 pypi

DESCRIPTION="AI-native encrypted P2P chat — sovereign communication for humans and AI"
HOMEPAGE="https://skchat.io https://github.com/smilinTux/skchat https://pypi.org/project/skchat-sovereign/"

S="${WORKDIR}/skchat_sovereign-${PV}"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

# PGPy (PGP library) is not yet packaged in portage
RDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/click-8.1[${PYTHON_USEDEP}]
		>=dev-python/pydantic-2.0[${PYTHON_USEDEP}]
		>=dev-python/pyyaml-6.0[${PYTHON_USEDEP}]
		>=dev-python/rich-13.0[${PYTHON_USEDEP}]
	')
"
BDEPEND="
	$(python_gen_cond_dep '
		dev-python/setuptools-scm[${PYTHON_USEDEP}]
	')
"
