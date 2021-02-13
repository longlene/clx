# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="f9bd21446f35e28766d2f1ada2741399b14d93cb"

DESCRIPTION="Common Lisp implementation of RFC 4122"
HOMEPAGE="https://github.com/mon-key/unicly"
SRC_URI="https://github.com/mon-key/unicly/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/ironclad
	dev-lisp/split-sequence
"
BDEPEND=""
