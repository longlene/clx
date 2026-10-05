# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Like shlex, but for Windows command-line quoting"
HOMEPAGE="
	https://github.com/smoofra/mslex
	https://pypi.org/project/mslex/
"
SRC_URI="https://github.com/smoofra/mslex/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

EPYTEST_PLUGINS=()

distutils_enable_tests pytest
