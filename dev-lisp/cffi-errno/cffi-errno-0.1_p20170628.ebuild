# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="46853c4b93df79686f0aac10b34d92a7aad29eba"

DESCRIPTION="Common Lisp wrapper for Unix error codes"
HOMEPAGE="https://github.com/cffi-posix/cffi-errno"
SRC_URI="https://github.com/cffi-posix/cffi-errno/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
"
BDEPEND=""
