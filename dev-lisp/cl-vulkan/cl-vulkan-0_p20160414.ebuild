# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3

EGIT_COMMIT="315cd1782d43ca63b88c9a4bbbed34e54ba2e98c"

DESCRIPTION="low- to mid-level Common Lisp/CFFI bindings for Vulkan API"
HOMEPAGE="https://github.com/3b/cl-vulkan"
SRC_URI="https://github.com/3b/cl-vulkan/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/alexandria
	dev-libs/vulkan
"
