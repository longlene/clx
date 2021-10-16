# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake vcs-snapshot

EGIT_COMMIT="42a0dc2a4dc491c46638bf57931404cd839c3437"

DESCRIPTION="The Tensor Algebra Compiler (taco) computes tensor expressions on sparse and dense tensors"
HOMEPAGE="https://github.com/tensor-compiler/taco"
SRC_URI="https://github.com/tensor-compiler/taco/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -e "/install/{s#DESTINATION\ lib#DESTINATION\ $(get_libdir)#}" \
		-i src/CMakeLists.txt
}
