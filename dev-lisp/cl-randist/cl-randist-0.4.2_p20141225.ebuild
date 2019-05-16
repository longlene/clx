# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="f088a54b540a7adefab7c04094a6103f9edda3d0"

DESCRIPTION="Random number generation for common lisp"
HOMEPAGE="https://github.com/lvaruzza/cl-randist"
SRC_URI="https://github.com/lvaruzza/cl-randist/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
