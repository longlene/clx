# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="JSON Pointer and JSON Patch for Python"
HOMEPAGE="
	https://pypi.org/project/jsonpath/
	https://github.com/jg-rp/python-jsonpath
"
SRC_URI="
	https://github.com/jg-rp/python-jsonpath/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
S="${WORKDIR}"/python-${P}
KEYWORDS="~amd64"

#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest
