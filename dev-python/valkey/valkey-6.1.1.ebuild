# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

MY_PN="${PN}-py"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Python client for Valkey forked from redis-py"
HOMEPAGE="
	https://pypi.org/project/valkey/
	https://github.com/valkey-io/valkey-py
"
SRC_URI="https://github.com/valkey-io/valkey-py/archive/refs/tags/v${PV}.tar.gz -> ${MY_P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

S="${WORKDIR}"/${MY_P}
