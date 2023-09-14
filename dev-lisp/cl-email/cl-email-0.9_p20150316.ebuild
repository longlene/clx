# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="bad8a15d033a17768a3408b7c93c429a64a47577"

DESCRIPTION="a small common lisp library to easily compose emails"
HOMEPAGE="https://github.com/mbattyani/cl-email"
SRC_URI="https://github.com/mbattyani/cl-email/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-smtp
	dev-lisp/cl-base64
"
