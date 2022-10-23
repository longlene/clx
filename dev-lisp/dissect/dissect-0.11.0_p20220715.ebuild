# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="6c15c887a8d3db2ce83037ff31f8a0b528aa446b"

DESCRIPTION="Common Lisp introspection library for the call stack and restarts"
HOMEPAGE="https://shinmera.github.io/dissect"
SRC_URI="https://github.com/Shinmera/dissect/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
