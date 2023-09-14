# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="78050f4f55c138fcea86a9d720928782021b6012"

DESCRIPTION="Call functions automatically when Common Lisp exit"
HOMEPAGE="https://github.com/ailisp/exit-hooks"
SRC_URI="https://github.com/ailisp/exit-hooks/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
