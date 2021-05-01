# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="78a940d18a822b78a00ed29b70a6403ee05e7a51"

DESCRIPTION="DRM/GBM backend for Ulubis"
HOMEPAGE="https://github.com/malcolmstill/ulubis-drm-gbm"
SRC_URI="https://github.com/malcolmstill/ulubis-drm-gbm/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/osicat
	dev-lisp/cepl-drm-gbm
	dev-lisp/cl-libinput
	dev-lisp/ulubis
"
