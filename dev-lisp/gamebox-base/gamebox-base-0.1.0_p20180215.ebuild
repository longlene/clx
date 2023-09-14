# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="9f021cf508d46821dea80808a372c47157d5dd07"

DESCRIPTION="A framework for creating video games"
HOMEPAGE="https://github.com/mfiano/gamebox-base"
SRC_URI="https://github.com/mfiano/gamebox-base/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/sdl2kit
	dev-lisp/fs-utils
	dev-lisp/simple-logger
	dev-lisp/gamebox-frame-manager
"

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}
