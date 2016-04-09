# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="just wrapper libsndfile for Common Lisp"
HOMEPAGE="https://github.com/byulparan/cl-sndfile"
SRC_URI=""

EGIT_REPO_URI="https://github.com/byulparan/cl-sndfile.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cffi
	dev-lisp/simple-utils
	media-libs/libsndfile
"
