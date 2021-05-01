# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="778a312e9eb3d3de7541457b516ea3d9055a15aa"

DESCRIPTION="Common Lisp implementation of (grid restrained) Nelder-Mead"
HOMEPAGE="https://github.com/rigetticomputing/cl-grnm"
SRC_URI="https://github.com/rigetticomputing/cl-grnm/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all VERSION.txt
}
