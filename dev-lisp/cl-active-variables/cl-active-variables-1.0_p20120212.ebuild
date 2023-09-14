# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="9ca2a7a87833b8892a2963d5c71a66019e906eb0"

DESCRIPTION="Common Lisp variables with read/write callbacks"
HOMEPAGE="https://github.com/kruhft/cl-active-variables"
SRC_URI="https://github.com/kruhft/cl-active-variables/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
