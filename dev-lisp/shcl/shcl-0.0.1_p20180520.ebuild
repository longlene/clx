# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="9c4f01ca321e6dc70748a05fe54a8007577238f5"

DESCRIPTION="SHell in Common Lisp"
HOMEPAGE="https://github.com/bradleyjensen/shcl"
SRC_URI="https://github.com/bradleyjensen/shcl/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-lisp/cffi
	dev-lisp/fset
"
RDEPEND="${DEPEND}"

src_compile() {
	emake
}
