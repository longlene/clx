# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="bea6e3c2864beb1541a11c89a5fd538fd873c8f9"

DESCRIPTION="A standard interface to the various stream column functions of Common Lisp"
HOMEPAGE="https://github.com/yitzchak/trivial-stream-column"
SRC_URI="https://github.com/yitzchak/trivial-stream-column/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/trivial-gray-streams
"
BDEPEND=""
