# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit vcs-snapshot

EGIT_COMMIT="c56a8023b421e3bf0a55e775237d0abf09c33c5c"

DESCRIPTION="Modified libTH and libTHNN for TH(Common Lisp) library"
HOMEPAGE="https://bitbucket.org/chunsj/libth"
SRC_URI="https://bitbucket.org/chunsj/libth/get/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
