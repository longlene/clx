# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 python3_8 )
inherit distutils-r1

DESCRIPTION="Image augmentation for machine learning experiments"
HOMEPAGE="https://github.com/aleju/imgaug"
SRC_URI="https://github.com/aleju/imgaug/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-python/numpy
	dev-python/six
	sci-libs/scikits_image
	sci-libs/scipy
	media-libs/opencv
"
RDEPEND="${DEPEND}"
