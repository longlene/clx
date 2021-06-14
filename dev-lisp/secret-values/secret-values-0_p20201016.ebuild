# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="72996c0551eea338afa355ee90e20171ac74ebd4"

DESCRIPTION="A Common Lisp library to reduce the risk of accidentally revealing secret values"
HOMEPAGE="https://github.com/rotatef/secret-values"
SRC_URI="https://github.com/rotatef/secret-values/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
