# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Easily use bleach with Django models and templates"
HOMEPAGE="https://github.com/marksweb/django-bleach"
SRC_URI="https://github.com/marksweb/django-bleach/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/bleach-5[${PYTHON_USEDEP}]
	dev-python/django[${PYTHON_USEDEP}]
"

RESTRICT="test"
