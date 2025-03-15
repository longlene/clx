# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10,11} )
inherit distutils-r1

DESCRIPTION="The fastai deep learning library"
HOMEPAGE="http://docs.fast.ai/"
SRC_URI="https://github.com/fastai/fastai/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	>=dev-python/fastcore-1.3.8
	>=dev-python/torchvision-0.8
	dev-python/matplotlib
	>=dev-python/pandas-1.0.0
	dev-python/requests
	dev-python/pyyaml
	>=dev-python/fastprogress-0.2.4
	>=dev-python/pillow-6.0.0
	sci-ml/scikit-learn
	dev-python/scipy
	dev-python/spacy
	>=sci-ml/pytorch-1.7.0
"
BDEPEND=""
