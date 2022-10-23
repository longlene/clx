# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="5d4744025c25a7aae4c455e53efc74c95a10d4e3"

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
