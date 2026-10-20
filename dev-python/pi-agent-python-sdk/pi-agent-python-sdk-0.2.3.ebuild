# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="Use your installed Pi coding agent as a Python API"
HOMEPAGE="
	https://pypi.org/project/pi-agent-python-sdk/
	https://github.com/cheenulabs/pi-agent-python-sdk/
"
SRC_URI="$(pypi_sdist_url "${PN}")"
S="${WORKDIR}"/pi_agent_python_sdk-${PV}

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="${PYTHON_DEPS}"

# No test phase: the PyPI sdist (hatch sdist only-include) ships only
# src/pi_agent plus docs; the tests/ directory is excluded, so there is
# nothing to run. Re-add a `test` flag if upstream starts shipping tests.
