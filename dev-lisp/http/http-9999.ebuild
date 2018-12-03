# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="Simple HTTP Package for ClozureCL"
HOMEPAGE="https://github.com/massung/http"
SRC_URI=""

EGIT_REPO_URI="https://github.com/massung/http.git"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/sha1
	dev-lisp/parse
	dev-lisp/re
	dev-lisp/url
"
