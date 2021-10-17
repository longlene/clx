# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 )

inherit cmake python-r1 vcs-snapshot

DESCRIPTION="Caffe: a fast open framework for deep learning"
HOMEPAGE="http://caffe.berkeleyvision.org/"
SRC_URI="https://github.com/BVLC/caffe/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="cuda python"

DEPEND="
	dev-libs/boost[threads]
	cuda? ( dev-util/nvidia-cuda-toolkit dev-libs/nvidia-cuda-cudnn )
	dev-db/lmdb
	dev-libs/leveldb
	media-libs/opencv
	python? ( ${PYTHON_DEPS} )
	sci-libs/atlas
	sci-libs/hdf5
	virtual/cblas
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
	-DCPU_ONLY=$(usex !cuda)
	)
	cmake_src_configure
}
