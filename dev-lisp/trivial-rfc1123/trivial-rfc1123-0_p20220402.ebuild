# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="9ef59c3fdec08b0e3c9ed02d39533887b6d1b8e3"

DESCRIPTION="parse and print RFC-1123 timestamps"
HOMEPAGE="https://github.com/stacksmith/trivial-rfc-1123"
SRC_URI="https://github.com/stacksmith/trivial-rfc-1123/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-ppcre
"
BDEPEND=""
