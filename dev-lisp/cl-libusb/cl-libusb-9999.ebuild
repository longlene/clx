# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="Common Lisp bindings to libusb"
HOMEPAGE="https://github.com/soemraws/cl-libusb"
SRC_URI=""

EGIT_REPO_URI="https://github.com/soemraws/cl-libusb.git"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/trivial-garbage
	dev-lisp/cffi
	dev-lisp/antik
	dev-libs/libusb
"
