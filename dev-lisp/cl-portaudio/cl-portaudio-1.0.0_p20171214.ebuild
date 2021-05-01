# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="3e6c28e4c28d42bbe55ccccd6baad7b60577149d"

DESCRIPTION="Common Lisp bindings to portaudio library"
HOMEPAGE="https://github.com/filonenko-mikhail/cl-portaudio"
SRC_URI="https://github.com/filonenko-mikhail/cl-portaudio/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/ffa
	dev-lisp/atdoc
	media-libs/portaudio
"
