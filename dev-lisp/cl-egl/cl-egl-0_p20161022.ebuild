# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="063680440c85a637d66f9835a2ec46fc4a886e56"

DESCRIPTION="Common Lisp wrapper to libEGL"
HOMEPAGE="https://github.com/malcolmstill/cl-egl"
SRC_URI="https://github.com/malcolmstill/cl-egl/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	media-libs/mesa
"
