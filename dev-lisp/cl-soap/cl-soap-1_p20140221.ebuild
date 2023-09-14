# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="d1a59ce4ba8b6e349ce33ba87e6413a1c07056c5"

DESCRIPTION="Common Lisp SOAP Package"
HOMEPAGE="https://github.com/mmaul/cl-soap/"
SRC_URI="https://github.com/mmaul/cl-soap/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/s-xml
	dev-lisp/puri
"
