# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=pdm-backend
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="Core functionality for Cua including telemetry and shared utilities"
HOMEPAGE="
	https://github.com/trycua/cua
	https://pypi.org/project/cua-core/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/posthog-3.20.0[${PYTHON_USEDEP}]
"

EPYTEST_PLUGINS=()

distutils_enable_tests pytest
