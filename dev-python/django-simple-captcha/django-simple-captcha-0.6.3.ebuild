# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="A simple yet highly customizable Django captcha application"
HOMEPAGE="https://github.com/mbi/django-simple-captcha"
SRC_URI="https://github.com/mbi/django-simple-captcha/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/django-4.2[${PYTHON_USEDEP}]
	>=dev-python/pillow-6.2.0[${PYTHON_USEDEP}]
	dev-python/django-ranged-response[${PYTHON_USEDEP}]
"

RESTRICT="test"
