# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_8 )
inherit distutils-r1

DESCRIPTION="Trained models for the face_recognition python library"
HOMEPAGE="https://github.com/ageitgey/face_recognition_models"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"


LICENSE="CC0-1.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
