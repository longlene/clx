# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Support for many storage backends in Django"
HOMEPAGE="https://github.com/jschneier/django-storages"
SRC_URI="https://github.com/jschneier/django-storages/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=">=dev-python/django-3.2[${PYTHON_USEDEP}]"

RESTRICT="test"
