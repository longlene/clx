# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="2b5418d9709725d8f63c7fc3cd358398745b7698"

DESCRIPTION="Parallel Operator on Independent Units, a parallelizing backend for ASDF"
HOMEPAGE="https://github.com/fare/poiu"
SRC_URI="https://github.com/fare/poiu/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
