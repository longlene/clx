# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="A Common Lisp binding for the Apache Thrift framework"
HOMEPAGE="https://github.com/lisp/de.setf.thrift"
SRC_URI=""

EGIT_REPO_URI="https://github.com/lisp/de.setf.thrift.git"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	virtual/puri
	dev-lisp/usocket
	dev-lisp/closer-mop
	dev-lsip/trivial-utf8
"
