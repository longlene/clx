# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="543c980443e65ae2c382e8e2c26b78c038e7f15e"

DESCRIPTION="This library introduces throttles to Common Lisp"
HOMEPAGE="https://github.com/vydd/cl-throttle"
SRC_URI="https://github.com/vydd/cl-throttle/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
