# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit lua vcs-snapshot

EGIT_COMMIT="690036d06c72a8845db64942434ad9c35836c315"

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
