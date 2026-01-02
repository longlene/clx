# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1 vcs-snapshot

DESCRIPTION="Industrial-strength Natural Language Processing (NLP) in Python"
HOMEPAGE="https://spacy.io/"
SRC_URI="https://github.com/explosion/spaCy/archive/refs/tags/v3.2.4.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
"
BDEPEND="
	>=dev-python/cymem-2.0.2[${PYTHON_USEDEP}]
	>=dev-python/preshed-3.0.2[${PYTHON_USEDEP}]
	>=dev-python/murmurhash-0.28.0[${PYTHON_USEDEP}]
	>=dev-python/thinc-8.3.4[${PYTHON_USEDEP}]
	>=dev-python/numpy-2.0.0[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
