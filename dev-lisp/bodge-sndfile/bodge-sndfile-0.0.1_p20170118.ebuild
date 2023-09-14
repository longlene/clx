# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="7c40d94b56852a234c8b4fe68b8612d12b12c168"

DESCRIPTION="Thin wrapper over libsndfile for Common Lisp"
HOMEPAGE="https://github.com/borodust/bodge-sndfile"
SRC_URI="https://github.com/borodust/bodge-sndfile/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cffi
	dev-lisp/cl-autowrap
	media-libs/libsndfile
"

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all spec
}
