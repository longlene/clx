# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="32b0d1ca3d9fa95327165b8090e1021bc563ed3e"

DESCRIPTION="A Common Lisp binding for the Apache Thrift framework"
HOMEPAGE="https://github.com/lisp/de.setf.thrift"
SRC_URI="https://github.com/lisp/de.setf.thrift/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

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
