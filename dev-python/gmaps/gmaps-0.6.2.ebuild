# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_4 )
inherit distutils-r1

DESCRIPTION="Google maps for Jupyter notebooks"
HOMEPAGE="https://github.com/pbugnion/gmaps"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-python/six
	>=dev-python/ipython-5.3.0
	>=dev-python/ipywidgets-7.0.0
	>=dev-python/traitlets-4.3.0
	>=dev-python/geojson-2.0.0
"
