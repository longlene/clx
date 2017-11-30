# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit vcs-snapshot

EGIT_COMMIT="1e729804f61c8627eb257fba8b83f74e04945db7"

DESCRIPTION="Convolutional Neural Networks"
HOMEPAGE="http://pjreddie.com/darknet/"
SRC_URI="https://github.com/pjreddie/darknet/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-util/nvidia-cuda-toolkit
	media-libs/opencv
"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -e '1s/GPU=0/GPU=1/' \
		-e '3s/OPENCV=0/OPENCV=1/' \
		-e 's#/usr/local/cuda/#/opt/cuda/#' \
		-i Makefile || die
}

src_install() {
	dobin darknet
	insinto /usr
	doins -r include
	dolib.so libdarknet.so
	dodoc README.md
}
