# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit lua vcs-snapshot

EGIT_COMMIT="f441809e1d1fcfb3871d4a3490519054c22036f5"

DESCRIPTION="FFI bindings for Torch7"
HOMEPAGE="https://github.com/torch/ffi"
SRC_URI="https://github.com/torch/ffi/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto $(lua_get_sharedir)/ffi
	doins init.lua apply.lua
	dodoc README.md
}
