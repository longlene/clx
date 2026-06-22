# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Parallelized drop-in replacements for Python's map function"
HOMEPAGE="https://github.com/allenai/bettermap"
SRC_URI="https://files.pythonhosted.org/packages/80/b4/1d74b7740723c1b85f3ae15d7b8d4a3d869f614fb1aa1982ed0055daf0ba/bettermap-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

python_prepare_all() {
	# setup.py calls parse_requirements_file("requirements.txt") but the sdist
	# doesn't ship this file; create an empty one so the build succeeds
	touch requirements.txt dev-requirements.txt || die
	distutils-r1_python_prepare_all
}
