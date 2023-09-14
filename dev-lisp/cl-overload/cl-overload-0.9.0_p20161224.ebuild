# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="4a0196299b3e6afbf575dc119a1679d9c819df24"

DESCRIPTION="Common Lisp library for function, method & macro overloading by parameter count"
HOMEPAGE="https://github.com/show-matz/CL-OVERLOAD"
SRC_URI="https://github.com/show-matz/CL-OVERLOAD/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
