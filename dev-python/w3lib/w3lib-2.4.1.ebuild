# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="Library of web-related functions"
HOMEPAGE="https://scrapy.org/ https://pypi.org/project/w3lib/ https://github.com/scrapy/w3lib"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

distutils_enable_tests pytest

EPYTEST_DESELECT=(
	# https://github.com/scrapy/w3lib/issues/164
	tests/test_url.py::UrlTests::test_add_or_replace_parameter
)
