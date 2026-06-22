# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="Standard API for reinforcement learning and reference environments"
HOMEPAGE="https://gymnasium.farama.org https://github.com/Farama-Foundation/Gymnasium https://pypi.org/project/gymnasium/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="classic-control mujoco toy-text"
RESTRICT="test"

RDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/cloudpickle-1.2.0[${PYTHON_USEDEP}]
		dev-python/farama-notifications[${PYTHON_USEDEP}]
		>=dev-python/numpy-1.21.0[${PYTHON_USEDEP}]
		>=dev-python/typing-extensions-4.3.0[${PYTHON_USEDEP}]
		classic-control? ( >=dev-python/pygame-ce-2.1.3[${PYTHON_USEDEP}] )
		mujoco? (
			dev-python/imageio[${PYTHON_USEDEP}]
			dev-python/mujoco[${PYTHON_USEDEP}]
		)
		toy-text? ( >=dev-python/pygame-ce-2.1.3[${PYTHON_USEDEP}] )
	')
"
