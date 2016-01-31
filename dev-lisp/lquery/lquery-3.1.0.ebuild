# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3

DESCRIPTION="A Common Lisp library to allow jQuery-like HTML/DOM manipulation"
HOMEPAGE="https://shinmera.github.io/lquery"
SRC_URI="https://github.com/Shinmera/lquery/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/array-utils
dev-lisp/plump
dev-lisp/clss
"
