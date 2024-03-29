# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="e717a7fe076dae861a96117b2f9af29db8d2294d"

DESCRIPTION="A batteries-included tracing and debug-logging macro"
HOMEPAGE="https://github.com/danlentz/printv"
SRC_URI="https://github.com/danlentz/printv/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -i '/static-file "README.md/d' ${PN}.asd
}
