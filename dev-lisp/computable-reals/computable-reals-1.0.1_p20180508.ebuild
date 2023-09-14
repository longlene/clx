# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="0b82437d19323d0dd889a57fcd43e4ee8dcbfa65"

DESCRIPTION="Computable real numbers"
HOMEPAGE="https://github.com/stylewarning/computable-reals"
SRC_URI="https://github.com/stylewarning/computable-reals/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
