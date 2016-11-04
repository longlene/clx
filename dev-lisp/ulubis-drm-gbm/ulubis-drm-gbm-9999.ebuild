# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="DRM/GBM backend for Ulubis"
HOMEPAGE="https://github.com/malcolmstill/ulubis-drm-gbm"
SRC_URI=""

EGIT_REPO_URI="https://github.com/malcolmstill/ulubis-drm-gbm.git"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/osicat
	dev-lisp/cepl_drm-gbm
	dev-lisp/cl-libinput
	dev-lisp/ulubis
"
