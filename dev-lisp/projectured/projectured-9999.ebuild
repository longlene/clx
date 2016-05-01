# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="ProjecturEd is a generic purpose projectional editor"
HOMEPAGE="http://www.projectured.org/"
SRC_URI=""

EGIT_REPO_URI="https://github.com/projectured/projectured.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="
	media-libs/libsdl2
	media-libs/sdl2-image
	media-libs/sdl2-ttf
"
RDEPEND="${DEPEND}"


src_prepare() {
	./bin/build.sh
}
