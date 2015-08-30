# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="Common Lisp IRC bot with a modular framework"
HOMEPAGE="https://shinmera.github.io/colleen"
SRC_URI="https://github.com/Shinmera/colleen/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/bordeaux-threads
dev-lisp/universal-config
dev-lisp/verbose
dev-lisp/usocket
dev-lisp/flexi-streams
dev-lisp/uuid
dev-lisp/cl-ppcre
dev-lisp/trivial-arguments
"
