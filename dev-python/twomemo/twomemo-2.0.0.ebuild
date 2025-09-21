# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Backend implementation of the namespace 'urn:xmpp:omemo:2' for python-omemo"
HOMEPAGE="
	https://pypi.org/project/python-twomemo/
	https://github.com/Syndace/python-twomemo/
"
SRC_URI="https://github.com/Syndace/python-twomemo/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/omemo-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/doubleratchet-1.2.0[${PYTHON_USEDEP}]
	>=dev-python/x3dh-1.2.0[${PYTHON_USEDEP}]
	>=dev-python/xeddsa-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/protobuf-3.20.3[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.3.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

S="${WORKDIR}"/python-${P}

PATCHES=(
	"${FILESDIR}"/install-fix.patch
)
