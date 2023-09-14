# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake lua vcs-snapshot

EGIT_COMMIT="258e80bd55ce8515b1307f874adfcb786947dd65"

DESCRIPTION="A set of primitives for parallel computation in Torch"
HOMEPAGE="https://github.com/twitter/torch-ipc"
SRC_URI="https://github.com/twitter/torch-ipc/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="cuda static-libs"

DEPEND="
	sci-libs/torch7[cuda?]
	>=dev-util/nvidia-cuda-toolkit-7.0
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		"-DBUILD_STATIC=$(usex static-libs)"
	)
	local CUDA=YES
	use cuda || CUDA=NO

	CUDA=${CUDA} cmake_src_configure
}
