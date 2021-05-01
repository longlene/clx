# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="530f1ec06427c69966d83c86638be628eacb9502"

DESCRIPTION="Common Lisp FTP client library"
HOMEPAGE="https://github.com/pinterface/cl-ftp"
SRC_URI="https://github.com/pinterface/cl-ftp/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
