# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="1ae6a4b9ded6e613ca7d58bc6b73f2c5d66e2f67"

DESCRIPTION="Common Lisp bindings to libresect"
HOMEPAGE="https://github.com/borodust/cl-resect"
SRC_URI="https://github.com/borodust/cl-resect/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cffi
"
BDEPEND=""
