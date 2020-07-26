# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit common-lisp-3 git-r3

DESCRIPTION="POSIX-compatible Lisp Unix shell"
HOMEPAGE="https://github.com/jasom/plush"
SRC_URI=""

EGIT_REPO_URI="https://github.com/jasom/plush.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/alexandria
dev-lisp/esrap
dev-lisp/cl-ppcre
dev-lisp/split-sequence
dev-lisp/iolib
dev-lisp/clinenoise
"
