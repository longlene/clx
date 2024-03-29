# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="RSS Package for LispWorks"
HOMEPAGE="https://github.com/massung/rss"
SRC_URI=""

EGIT_REPO_URI="https://github.com/massung/rss.git"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/http
	dev-lisp/url
	dev-lisp/xml
	dev-lisp/rfc-date
"
