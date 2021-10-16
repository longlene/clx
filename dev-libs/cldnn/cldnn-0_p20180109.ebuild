# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake vcs-snapshot

EGIT_COMMIT="c1158e3cb944169c8bed4f64e3c0ac39797156e4"

DESCRIPTION="Compute Library for Deep Neural Networks"
HOMEPAGE="https://github.com/intel/clDNN/"
SRC_URI="https://github.com/intel/clDNN/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -i "s#LIBRARY DESTINATION \"lib\"#LIBRARY DESTINATION \"$(get_libdir)\"#" src/CMakeLists.txt
}
