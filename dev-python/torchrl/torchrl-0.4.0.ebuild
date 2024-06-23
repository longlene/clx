# Copyright 2024 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="A modular, primitive-first, python-first PyTorch library for Reinforcement Learning"
HOMEPAGE="
	https://pytorch.org/rl
	https://github.com/pytorch/rl
"
SRC_URI="https://github.com/pytorch/rl/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	>=sci-libs/pytorch-2.3.0[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	dev-python/cloudpickle[${PYTHON_USEDEP}]
	>=dev-python/tensordict-0.4.0[${PYTHON_USEDEP}]
"

S="${WORKDIR}"/rl-${PV}
