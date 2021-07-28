# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="60693b4a1354faf17107ad6003b0b870cca37081"

DESCRIPTION="provides an easy way to catch ctrl+c. useful for making binaries"
HOMEPAGE="https://github.com/compufox/with-user-abort"
SRC_URI="https://github.com/compufox/with-user-abort/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
