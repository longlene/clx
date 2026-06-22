# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Agent Swarm Intelligence framework"
HOMEPAGE="https://github.com/HKUDS/ClawTeam"
SRC_URI="https://github.com/HKUDS/ClawTeam/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/ClawTeam-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="p2p"

RDEPEND="$(python_gen_cond_dep '
	>=dev-python/typer-0.12.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/rich-13.0.0[${PYTHON_USEDEP}]
	>=dev-python/questionary-2.0.1[${PYTHON_USEDEP}]
	p2p? ( >=dev-python/pyzmq-25.0.0[${PYTHON_USEDEP}] )
')"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
