# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="cc8d3c841b8b64b6715bf8f238fb19cd6093a793"

DESCRIPTION="SHell in Common Lisp"
HOMEPAGE="https://github.com/bradleyjensen/shcl"
SRC_URI="https://github.com/bradleyjensen/shcl/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="
	dev-lisp/sbcl
	dev-lisp/cffi
"

src_install() {
	dobin shcl
	dolib.so libshcl-support.so
	dodoc README.org
}
