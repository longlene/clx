# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="bce566bcec84258abab047fb452a0d736804981b"

DESCRIPTION="A portable Common Lisp toolkit for building inspectors"
HOMEPAGE="https://github.com/aartaka/trivial-inspect"
SRC_URI="https://github.com/aartaka/trivial-inspect/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/trivial-arguments
"
BDEPEND=""
