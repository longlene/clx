# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Simple migration engine for Peewee"
HOMEPAGE="
	https://pypi.org/project/peewee_migrate/
	https://github.com/klen/peewee_migrate
"
SRC_URI="https://github.com/klen/peewee_migrate/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/peewee[${PYTHON_USEDEP}]
	dev-python/click[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

S="${WORKDIR}"/peewee_migrate-${PV}
