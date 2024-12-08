# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_13 )

inherit distutils-r1

DESCRIPTION="LTS Port of Python audioop"
HOMEPAGE="
	https://github.com/AbstractUmbra/audioop
	https://pypi.org/project/audioop-lts/
"
SRC_URI="https://github.com/AbstractUmbra/audioop/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="PSF-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

S="${WORKDIR}"/audioop-${PV}
