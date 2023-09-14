# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="Common Lisp Graylog client library"
HOMEPAGE="https://github.com/mmontone/cl-graylog"
SRC_URI=""

EGIT_REPO_URI="https://github.com/mmontone/cl-graylog.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/local-time
	dev-lisp/usocket
	dev-lisp/babel
	dev-lisp/salza2
	dev-lisp/cl-json
	dev-lisp/log5
"
