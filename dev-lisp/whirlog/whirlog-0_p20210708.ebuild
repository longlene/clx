# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit vcs-snapshot

EGIT_COMMIT="4c5728cdb0800a0ad1b1496b3af1706c499248fa"

DESCRIPTION="a minimal versioned log structured relational DB in Common Lisp"
HOMEPAGE="https://github.com/codr7/whirlog"
SRC_URI="https://github.com/codr7/whirlog/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
