# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="Shows a 503 error page when maintenance-mode is on"
HOMEPAGE="https://github.com/fabiocaccamo/django-maintenance-mode"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/django[${PYTHON_USEDEP}]
	>=dev-python/python-fsutil-0.13.1[${PYTHON_USEDEP}]
"

RESTRICT="test"
