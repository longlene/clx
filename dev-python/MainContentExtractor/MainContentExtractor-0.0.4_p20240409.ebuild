# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

EGIT_COMMIT="7c3ed7f6ed7f6c10223a3357d43ab741663bc812"

DESCRIPTION="A library to extract the main content from html"
HOMEPAGE="
	https://github.com/HawkClaws/main_content_extractor
	https://pypi.org/project/MainContentExtractor/
"
SRC_URI="https://github.com/HawkClaws/main_content_extractor/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/trafilatura-1.6.2[${PYTHON_USEDEP}]
	>=dev-python/html2text-2020.1.16[${PYTHON_USEDEP}]
	>=dev-python/beautifulsoup4-4.12.2[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

#distutils_enable_tests pytest

RESTRICT="test"

S="${WORKDIR}"/main_content_extractor-${EGIT_COMMIT}
