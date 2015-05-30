# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="A Common Lisp logging framework using the piping library"
HOMEPAGE="https://shinmera.github.io/verbose"
SRC_URI=""

EGIT_REPO_URI="https://github.com/Shinmera/verbose.git"

LICENSE="Artistic-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/piping
dev-lisp/local-time
dev-lisp/bordeaux-threads
dev-lisp/split-sequence
dev-lisp/cl-fad
dev-lisp/clon
"
