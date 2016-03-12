# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="Common Lisp web development widget library for Twitter's Bootstrap"
HOMEPAGE="https://github.com/thephoeron/cl-bootstrap"
SRC_URI=""

EGIT_REPO_URI="https://github.com/thephoeron/cl-bootstrap.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-who
	dev-lisp/cl-css
	dev-lisp/parenscript
"
