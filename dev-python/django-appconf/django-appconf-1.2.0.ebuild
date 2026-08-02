# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="A helper class for handling configuration defaults of packaged Django apps"
HOMEPAGE="https://github.com/django-compressor/django-appconf"
SRC_URI="https://github.com/django-compressor/django-appconf/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND=">=dev-python/django-4.2[${PYTHON_USEDEP}]"
