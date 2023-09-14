# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="96a358ede7cef416d61d2f699e724fe1d9de602c"

DESCRIPTION="A compatability layer for dealing with package locks in a uniform manner"
HOMEPAGE="https://github.com/elliottjohnson/cl-package-locks"
SRC_URI="https://github.com/elliottjohnson/cl-package-locks/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
