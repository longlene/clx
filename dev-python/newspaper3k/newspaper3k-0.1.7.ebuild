# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="News, full-text, and article metadata extraction in Python 3"
HOMEPAGE="https://github.com/codelucas/newspaper"
SRC_URI="https://github.com/codelucas/newspaper/archive/refs/tags/${PV}.tar.gz
	-> ${P}.gh.tar.gz"
S="${WORKDIR}/newspaper-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/beautifulsoup4-4.4.1[${PYTHON_USEDEP}]
		>=dev-python/pillow-2.6.1[${PYTHON_USEDEP}]
		>=dev-python/pyyaml-3.11[${PYTHON_USEDEP}]
		>=dev-python/cssselect-0.9.1[${PYTHON_USEDEP}]
		>=dev-python/lxml-3.3.5[${PYTHON_USEDEP}]
		>=dev-python/nltk-3.0.1[${PYTHON_USEDEP}]
		>=dev-python/requests-2.3.0[${PYTHON_USEDEP}]
		dev-python/six[${PYTHON_USEDEP}]
		>=dev-python/feedparser-5.1.3[${PYTHON_USEDEP}]
		>=dev-python/tldextract-1.5.1[${PYTHON_USEDEP}]
		>=dev-python/python-dateutil-2.4.0[${PYTHON_USEDEP}]
	')
"
DEPEND="${RDEPEND}"
