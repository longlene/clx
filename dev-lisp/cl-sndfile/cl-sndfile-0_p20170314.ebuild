# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="ec32e0d69179ccc9af6b662f9e2c628e34be01a8"

DESCRIPTION="just wrapper libsndfile for Common Lisp"
HOMEPAGE="https://github.com/byulparan/cl-sndfile"
SRC_URI="https://github.com/byulparan/cl-sndfile/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cffi
	media-libs/libsndfile
"
