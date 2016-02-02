# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="Lisp CFFI Bindings for FreeImage"
HOMEPAGE="https://github.com/BradWBeer/cl-freeimage"
SRC_URI=""

EGIT_REPO_URI="https://github.com/BradWBeer/cl-freeimage.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	media-libs/freeimage
"
