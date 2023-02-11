# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{10,11} )
inherit distutils-r1 vcs-snapshot

DESCRIPTION="Data loaders and abstractions for text and NLP"
HOMEPAGE="https://github.com/pytorch/text"
SRC_URI="https://github.com/pytorch/text/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	sci-libs/pytorch
	dev-python/tqdm
	dev-python/requests
	dev-python/numpy
"
RDEPEND="${DEPEND}"
BDEPEND=""
