# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..9} )
inherit distutils-r1 vcs-snapshot

DESCRIPTION="Industrial-strength Natural Language Processing (NLP) in Python"
HOMEPAGE="https://spacy.io/"
SRC_URI="https://github.com/explosion/spaCy/archive/refs/tags/v3.2.4.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/cymem
	dev-python/preshed
	dev-python/thinc
	dev-python/ml_datasets
	dev-python/murmurhash
	dev-python/wasabi
	dev-python/srsly
	dev-python/catalogue
	dev-python/typer
	dev-python/pathy
	dev-python/numpy
	dev-python/requests
	dev-python/tqdm
	dev-python/pydantic
	dev-python/jinja2
	dev-python/langcodes
"
BDEPEND=""

distutils_enable_tests pytest
