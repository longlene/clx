# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit lua vcs-snapshot

EGIT_COMMIT="6e72b866e0a7fe544b7de2d9951063c9c11c00e3"

DESCRIPTION="Efficient, reusable RNNs and LSTMs for torch"
HOMEPAGE="https://github.com/jcjohnson/torch-rnn"
SRC_URI="https://github.com/jcjohnson/torch-rnn/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="opencl cuda"

DEPEND="
	sci-libs/torch7
	sci-libs/torch-nn
	opencl? ( sci-libs/cltorch sci-libs/clnn )
	cuda? ( sci-libs/torch-cutorch sci-libs/torch-cunn )
"
RDEPEND="${DEPEND}"

src_install() {
	insinto $(lua_get_sharedir)/torch-rnn
	doins -r *.lua util

	dodoc README.md
}
