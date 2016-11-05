# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="Random number generation for common lisp"
HOMEPAGE="https://github.com/lvaruzza/cl-randist"
SRC_URI=""

EGIT_REPO_URI="https://github.com/lvaruzza/cl-randist.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
