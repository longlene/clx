# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="30e8b14c053ea85c8fe71ede3346e584402c564a"

DESCRIPTION="A getf that works with Generalized Variables"
HOMEPAGE="https://gitlab.com/Harag/cl-getx"
SRC_URI="https://gitlab.com/Harag/cl-getx/-/archive/${EGIT_COMMIT}/cl-getx-${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
