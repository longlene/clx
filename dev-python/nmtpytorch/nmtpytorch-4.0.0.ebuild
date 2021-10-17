# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 python3_8 )
inherit distutils-r1

DESCRIPTION="Neural Machine Translation Framework in PyTorch"
HOMEPAGE="https://github.com/lium-lst/nmtpytorch"
SRC_URI="https://github.com/lium-lst/nmtpytorch/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-python/numpy
	sci-libs/scipy
	dev-python/pytorch
	sci-libs/scikits_learn
	dev-python/tqdm
	dev-python/pillow
	dev-python/torchvision
"
