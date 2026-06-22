# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Detect PII entities in text using NLP and pattern recognizers"
HOMEPAGE="https://github.com/microsoft/presidio"
SRC_URI="https://github.com/microsoft/presidio/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/presidio-${PV}/presidio-analyzer"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
# tests require downloading spaCy NLP models
RESTRICT="test"

RDEPEND="$(python_gen_cond_dep '
	>=dev-python/spacy-3.4.4[${PYTHON_USEDEP}]
	dev-python/regex[${PYTHON_USEDEP}]
	dev-python/tldextract[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	>=dev-python/phonenumbers-8.12[${PYTHON_USEDEP}]
	<dev-python/pydantic-3[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.0.0[${PYTHON_USEDEP}]
')"
