# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="2d0ed7d22da6bfe9a60cd18972749c99bd17bff8"

DESCRIPTION="Common Lisp wrapper to libdrm"
HOMEPAGE="https://github.com/malcolmstill/cl-drm"
SRC_URI="https://github.com/malcolmstill/cl-drm/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	x11-libs/libdrm
"
