# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="6e4b19aa51d7071ddf6e568e160bc1d53989e2f0"

DESCRIPTION="Reference foreign memory with elegance"
HOMEPAGE="https://github.com/borodust/cffi-c-ref"
SRC_URI="https://github.com/borodust/cffi-c-ref/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cffi
"
BDEPEND=""

src_prepare() {
	default
	sed -i '/defsystem :cffi-c-ref\/tests,$d' ${PN}.asd
}
