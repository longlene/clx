# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Developer-friendly asynchrony for Django"
HOMEPAGE="
	https://pypi.org/project/channels/
	https://github.com/django/channels
"
SRC_URI="https://github.com/django/channels/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/django-4.2.0[${PYTHON_USEDEP}]
	>=dev-python/asgiref-3.9.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

src_prepare() {
	default
	rm -rf tests
}
