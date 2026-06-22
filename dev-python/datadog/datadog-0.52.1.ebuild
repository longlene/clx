# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="The Datadog Python library"
HOMEPAGE="
	https://github.com/DataDog/datadogpy
	https://pypi.org/project/datadog/
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/requests-2.6.0[${PYTHON_USEDEP}]
	')
"

RESTRICT="test"
