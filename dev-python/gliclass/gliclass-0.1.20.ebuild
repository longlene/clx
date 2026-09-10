# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Generalist and lightweight model for zero-shot text classification"
HOMEPAGE="https://github.com/knowledgator/gliclass"
SRC_URI="https://github.com/knowledgator/gliclass/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/GLiClass-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/pytorch-2.0
	>=sci-ml/transformers-5.0
	$(python_gen_cond_dep '
		>=dev-python/scikit-learn-1.0[${PYTHON_USEDEP}]
		>=dev-python/numpy-2.0[${PYTHON_USEDEP}]
	')
"
