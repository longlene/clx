# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3 git-r3

DESCRIPTION="A library providing an easy-to-use API for working with memory-mapped files"
HOMEPAGE="https://github.com/zodmaner/trivial-mmap/"
SRC_URI=""

EGIT_REPO_URI="https://github.com/zodmaner/trivial-mmap.git"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/osicat
"
