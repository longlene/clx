# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Gather text and metadata on the Web: crawling, scraping, extraction"
HOMEPAGE="https://trafilatura.readthedocs.io/ https://github.com/adbar/trafilatura"
SRC_URI="https://github.com/adbar/trafilatura/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="curl speed zstd"
RESTRICT="test"

# Required runtime deps not yet packaged in portage:
#   dev-python/courlan   (URL cleaning and validation)
#   dev-python/htmldate  (HTML date extraction)
#   dev-python/justext   (boilerplate removal)
# py3langid (language detection, optional) also not packaged.

RDEPEND="
	$(python_gen_cond_dep '
		dev-python/certifi[${PYTHON_USEDEP}]
		>=dev-python/charset-normalizer-3.4.0[${PYTHON_USEDEP}]
		>=dev-python/lxml-5.3.0[${PYTHON_USEDEP}]
		>=dev-python/urllib3-1.26[${PYTHON_USEDEP}]
		curl? ( dev-python/pycurl[${PYTHON_USEDEP}] )
		speed? (
			>=dev-python/faust-cchardet-2.1.19[${PYTHON_USEDEP}]
			app-arch/brotli[python,${PYTHON_USEDEP}]
		)
		zstd? ( >=dev-python/zstandard-0.23.0[${PYTHON_USEDEP}] )
	')
"
