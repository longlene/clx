# Copyright 2025 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="46cc7f7f5feeb80d679ce9d9bfcabc68e9fd9c9e"

DESCRIPTION="low- to mid-level Common Lisp/CFFI bindings for Vulkan API"
HOMEPAGE="https://github.com/awolven/cl-vulkan"
SRC_URI="https://github.com/awolven/cl-vulkan/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-libs/vulkan
"

src_prepare() {
	default
	rm -r ${PN}-demo.asd examples
}
