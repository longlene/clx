# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Generalist and lightweight model for relation extraction"
HOMEPAGE="https://github.com/jackboyla/GLiREL"
SRC_URI="https://github.com/jackboyla/GLiREL/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/GLiREL-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	sci-ml/pytorch
	sci-ml/transformers
	sci-ml/huggingface_hub
	sci-ml/datasets
	$(python_gen_cond_dep '
		sci-ml/seqeval[${PYTHON_USEDEP}]
		dev-python/tqdm[${PYTHON_USEDEP}]
	')
"
