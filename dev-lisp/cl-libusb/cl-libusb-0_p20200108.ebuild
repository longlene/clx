# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="66ae873f9391da34d4634d44d8e429ad054169f8"

DESCRIPTION="Common Lisp bindings to libusb"
HOMEPAGE="https://github.com/soemraws/cl-libusb"
SRC_URI="https://github.com/soemraws/cl-libusb/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

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
