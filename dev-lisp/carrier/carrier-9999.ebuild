# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="A lightweight, async HTTP client"
HOMEPAGE="https://github.com/orthecreedence/carrier"
SRC_URI=""

EGIT_REPO_URI="https://github.com/orthecreedence/carrier.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/alexandria
dev-lisp/babel
dev-lisp/fast-io
dev-lisp/cl-async
dev-lisp/cl-async-future
dev-lisp/quri
dev-lisp/fast-http"
