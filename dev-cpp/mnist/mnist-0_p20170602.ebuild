# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit vcs-snapshot

EGIT_COMMIT="3fecc3d77b24adbe05cf19c8193af48488759f0f"

DESCRIPTION="Simple C++ reader for MNIST dataset"
HOMEPAGE="https://github.com/wichtounet/mnist"
SRC_URI="https://github.com/wichtounet/mnist/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include
	doins -r include/mnist
	dodoc README.rst
}
