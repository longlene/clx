# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="1b79e85aa653e1ec87e21ca745abe51547866fa9"

DESCRIPTION="Common Lisp implementation of the Rails routes system for mapping URLs."
HOMEPAGE="https://github.com/archimag/cl-routes"
SRC_URI="https://github.com/archimag/cl-routes/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

RDEPEND="
	dev-lisp/iterate
	virtual/puri
	dev-lisp/split-sequence
	dev-lisp/lift
"

