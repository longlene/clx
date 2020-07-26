# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_8 )
inherit distutils-r1

DESCRIPTION="Minimal Jupyter C kernel"
HOMEPAGE="https://github.com/brendan-rius/jupyter-c-kernel"
SRC_URI="https://github.com/brendan-rius/jupyter-c-kernel/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-python/jupyter
"
