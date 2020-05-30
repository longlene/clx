# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="98b440731a0740c335b14d59372c4d09d0222a07"

DESCRIPTION="A portable Common Lisp condition system"
HOMEPAGE="https://github.com/phoe/portable-condition-system"
SRC_URI="https://github.com/phoe/portable-condition-system/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="CC0-1.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/split-sequence
"
BDEPEND=""

src_prepare() {
	default
	if ! use test ; then
		sed -i '/portable-condition-system\/test/,$d' ${PN}.asd
		rm -r t
	fi
}
