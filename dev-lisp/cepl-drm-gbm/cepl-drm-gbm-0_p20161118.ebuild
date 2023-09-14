# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="675119275ab557770a942e6eea0815d93835fa13"

DESCRIPTION="CEPL backend targetting Linux DRM/GBM"
HOMEPAGE="https://github.com/malcolmstill/cepl.drm-gbm"
SRC_URI="https://github.com/malcolmstill/cepl.drm-gbm/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cepl
	dev-lisp/osicat
	dev-lisp/cl-drm
	dev-lisp/cl-gbm
	dev-lisp/cl-egl
"
