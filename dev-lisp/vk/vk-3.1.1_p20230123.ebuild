# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="b6a275486d5a8a7dd5640ba65f0c024db6127669"

DESCRIPTION="Common Lisp/CFFI bindings for the Vulkan API"
HOMEPAGE="https://github.com/JolifantoBambla/vk"
SRC_URI="https://github.com/JolifantoBambla/vk/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/alexandria
"
BDEPEND=""

src_prepare() {
	default
	sed -i '/defsystem vk\/tests/,$d' ${PN}.asd
}
