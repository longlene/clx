# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 python3_7 )
inherit distutils-r1

DESCRIPTION="Open-Source Neural Machine Translation"
HOMEPAGE="https://opennmt.net/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-python/six
	dev-python/tqdm
	dev-python/pytorch
	dev-python/torchtext
	dev-python/future
	dev-python/configargparse
	>=dev-python/tensorboard-1.14
	dev-python/flask
	dev-python/waitress
	dev-python/pyonmttok
	dev-python/pyyaml
"
BDEPEND=""
