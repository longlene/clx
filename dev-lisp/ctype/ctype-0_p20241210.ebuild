# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="6eb84dfbf1d41f251cc0c09f6e69a2b9415fd3d6"

DESCRIPTION="CL type system implementation"
HOMEPAGE="https://github.com/s-expressionists/ctype"
SRC_URI="https://github.com/s-expressionists/ctype/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
