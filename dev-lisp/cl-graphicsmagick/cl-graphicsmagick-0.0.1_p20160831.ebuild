# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="cbdcb7c7cbf52fcb372bee37af7f79a06de754c1"

DESCRIPTION="Common Lisp CFFI wrapper for GraphicsMagickWand"
HOMEPAGE="https://github.com/muyinliu/cl-graphicsmagick"
SRC_URI="https://github.com/muyinliu/cl-graphicsmagick/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	media-gfx/graphicsmagick
"
