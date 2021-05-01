# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="741f4c0567987967b74014c5115b9604490ce771"

DESCRIPTION="Lisp CFFI Bindings for FreeImage"
HOMEPAGE="https://github.com/BradWBeer/cl-freeimage"
SRC_URI="https://github.com/BradWBeer/cl-freeimage/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	media-libs/freeimage
"
