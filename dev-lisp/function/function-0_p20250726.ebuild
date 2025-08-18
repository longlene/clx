# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="d13eb6f238edb8ce2e2e89857f1d65c8baf23325"

DESCRIPTION="Higher order functions"
HOMEPAGE="https://github.com/jrm-code-project/function"
SRC_URI="https://github.com/jrm-code-project/function/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/fold
"
BDEPEND=""
