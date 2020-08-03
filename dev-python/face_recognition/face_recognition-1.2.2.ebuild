# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_8 )
inherit distutils-r1

DESCRIPTION="The world's simplest facial recognition api for Python and the command line"
HOMEPAGE="https://github.com/ageitgey/face_recognition"
SRC_URI="https://github.com/ageitgey/face_recognition/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-python/face_recognition_models
	dev-python/click
	dev-python/dlib
	dev-python/numpy
	dev-python/pillow
"
