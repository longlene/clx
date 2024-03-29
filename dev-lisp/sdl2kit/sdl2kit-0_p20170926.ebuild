# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

DESCRIPTION="Utility kit for CL-SDL2"
HOMEPAGE="https://github.com/lispgames/sdl2kit"
SRC_URI=""

EGIT_REPO_URI="https://github.com/lispgames/sdl2kit.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="example"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cl-sdl2
	dev-lisp/defpackage-plus
"

src_prepare() {
	eapply_user
	use example || rm -rf examples sdl2kit-examples.asd

}
