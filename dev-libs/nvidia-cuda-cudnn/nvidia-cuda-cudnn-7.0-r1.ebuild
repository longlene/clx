# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

PKG="cudnn-7.0-linux-x64-v4.0-prod"
SRC_URI="${PKG}.tgz"

DESCRIPTION="NVIDIA cuDNN GPU Accelerated Deep Learning"
HOMEPAGE="https://developer.nvidia.com/cuDNN"

SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
RESTRICT="fetch"
LICENSE="NVIDIA-cuDNN"

S="${WORKDIR}/${PKG}"

DEPENDS=">=dev-util/nvidia-cuda-toolkit-7.0"

pkg_nofetch() {
	einfo "Please download"
	einfo "  - ${SRC_URI}"
	einfo "from ${HOMEPAGE} and place them in ${DISTDIR}"
}

S="${WORKDIR}"/cuda

src_install() {
	dolib.so lib64/libcudnn*.so*
	dolib.a lib64/libcudnn_static.a

	insinto /usr/include
	doins include/cudnn.h
}
