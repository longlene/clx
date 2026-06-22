# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..15} )

inherit distutils-r1 pypi

DESCRIPTION="LP modeler that can call GLPK, CBC, CPLEX, and GUROBI solvers"
HOMEPAGE="https://github.com/coin-or/pulp https://pypi.org/project/PuLP/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

python_install_all() {
	distutils-r1_python_install_all
	# Remove bundled pre-compiled CBC solver binaries (EPL-1.0)
	# Install sci-libs/coinor-cbc separately for CBC support
	find "${ED}" -type f \( -name "cbc" -o -name "cbc.exe" -o -name "coin-license.txt" \) \
		-path "*/pulp/solverdir/*" -delete || die
}
