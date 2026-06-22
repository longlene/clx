# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Automatic summarization of text documents and HTML pages"
HOMEPAGE="https://miso-belica.github.io/sumy/ https://github.com/miso-belica/sumy"
SRC_URI="https://github.com/miso-belica/sumy/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="chinese lsa"
RESTRICT="test"

# Missing deps not yet in portage:
#   dev-python/docopt-ng    (CLI argument parsing)
#   dev-python/breadability  (HTML content extraction)
# Most language-specific extras (Japanese, Korean, Hebrew, Greek, Arabic, Thai, Polish)
# depend on unpackaged libraries.

RDEPEND="
	$(python_gen_cond_dep '
		dev-python/lxml-html-clean[${PYTHON_USEDEP}]
		dev-python/nltk[${PYTHON_USEDEP}]
		>=dev-python/pycountry-18.2.23[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		dev-python/setuptools[${PYTHON_USEDEP}]
		chinese? ( dev-python/jieba[${PYTHON_USEDEP}] )
		lsa? ( dev-python/numpy[${PYTHON_USEDEP}] )
	')
"
