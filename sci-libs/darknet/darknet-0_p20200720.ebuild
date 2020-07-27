# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit vcs-snapshot

EGIT_COMMIT="bc5ea7cca8c770ebdacd2c792ddd96f6904ee23a"

DESCRIPTION="Convolutional Neural Networks"
HOMEPAGE="http://pjreddie.com/darknet/"
SRC_URI="https://github.com/pjreddie/darknet/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="cuda"

DEPEND="
	cuda? ( dev-util/nvidia-cuda-toolkit )
	media-libs/opencv
"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	use cuda && sed -i '1s/GPU=0/GPU=1/' Makefile
	sed -e '3s/OPENCV=0/OPENCV=1/' \
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
