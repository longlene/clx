# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="Object that allows settings to be accessed with attributes"
HOMEPAGE="https://github.com/MrThearMan/django-settings-holder https://pypi.org/project/django-settings-holder/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="$(python_gen_cond_dep '
	>=dev-python/django-4.2[${PYTHON_USEDEP}]
')"
