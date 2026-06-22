# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="A Python Enum that inherits from str"
HOMEPAGE="
	https://pypi.org/project/strenum/
	https://github.com/irgeek/StrEnum
"
SRC_URI="https://github.com/irgeek/StrEnum/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
S="${WORKDIR}"/StrEnum-${PV}
KEYWORDS="~amd64"

#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

src_prepare() {
	# versioneer.py uses APIs removed in Python 3.12:
	# SafeConfigParser → RawConfigParser, readfp → read_file
	sed -i \
		-e 's/SafeConfigParser/RawConfigParser/g' \
		-e 's/\.readfp(/.read_file(/g' \
		versioneer.py || die
	distutils-r1_src_prepare
}
