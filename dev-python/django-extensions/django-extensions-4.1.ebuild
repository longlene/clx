# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="Extensions for Django"
HOMEPAGE="https://github.com/django-extensions/django-extensions https://pypi.org/project/django-extensions/"

S="${WORKDIR}/django_extensions-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="$(python_gen_cond_dep '
	>=dev-python/django-4.2[${PYTHON_USEDEP}]
')"
BDEPEND="${RDEPEND}"
