# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3 git-r3

DESCRIPTION="Tiny Common Lisp library to create image thumbnails with imagemagick"
HOMEPAGE="https://github.com/Shinmera/trivial-thumbnail"
SRC_URI=""

EGIT_REPO_URI="https://github.com/Shinmera/trivial-thumbnail.git"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	media-gfx/imagemagick
"
