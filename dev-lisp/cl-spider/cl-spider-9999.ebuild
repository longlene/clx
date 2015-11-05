# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="A Common Lisp Spider for the Web"
HOMEPAGE="https://github.com/VitoVan/cl-spider"
SRC_URI=""

EGIT_REPO_URI="https://github.com/VitoVan/cl-spider.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/drakma
	dev-lisp/plump
	dev-lisp/clss
"
