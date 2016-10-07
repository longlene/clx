# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="Common Lisp implementation of Clojure's threading macros"
HOMEPAGE="https://github.com/nightfly19/cl-arrows"
SRC_URI=""

EGIT_REPO_URI="https://github.com/nightfly19/cl-arrows.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
