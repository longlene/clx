# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="d910a4ed69dd6ddd6f64fb57b7491880d0754fa8"

DESCRIPTION="FOLD-LEFT and FOLD-RIGHT"
HOMEPAGE="https://github.com/jrm-code-project/fold"
SRC_URI="https://github.com/jrm-code-project/fold/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
