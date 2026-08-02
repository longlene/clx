# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="A Python interface for Reinforcement Learning environments"
HOMEPAGE="https://github.com/google-deepmind/dm_env"
SRC_URI="https://files.pythonhosted.org/packages/62/c9/93e8d6239d5806508a2ee4b370e67c6069943ca149f59f533923737a99b7/dm-env-${PV}.tar.gz"

S="${WORKDIR}/dm-env-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	dev-python/absl-py[${PYTHON_USEDEP}]
	dev-python/dm-tree[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
"
