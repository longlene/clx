# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="Simple Bloom filters in Common Lisp with efficient hashing"
HOMEPAGE="https://github.com/ruricolist/cl-bloom"
SRC_URI=""

EGIT_REPO_URI="https://github.com/ruricolist/cl-bloom.git"

LICENSE=""
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-murmurhash
	dev-lisp/static-vectors
"
