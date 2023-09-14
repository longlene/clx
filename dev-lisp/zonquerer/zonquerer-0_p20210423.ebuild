# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="2a0ff29b9d974fc66addb9126f1638f4d5d071cb"

DESCRIPTION="RTS-like game in 7 days"
HOMEPAGE="https://github.com/death/zonquerer"
SRC_URI="https://github.com/death/zonquerer/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="AGPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-sdl2
	dev-lisp/cl-autowrap
	dev-lisp/deploy
	dev-lisp/pileup
	dev-lisp/fset
	dev-lisp/pngload
	dev-lisp/alexandria
	dev-lisp/split-sequence
	dev-lisp/com_gigmonkeys_json
"
BDEPEND=""

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all assets
}
