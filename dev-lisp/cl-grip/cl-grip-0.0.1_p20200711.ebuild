# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="ff5aa651e6f1cd5f64f9c9457c95f4f2d19582a1"

DESCRIPTION="Common Lisp pluggable logging system"
HOMEPAGE="https://github.com/tychoish/cl-grip"
SRC_URI="https://github.com/tychoish/cl-grip/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/local-time
	dev-lisp/cl-strings
	dev-lisp/trivial-types
"
BDEPEND=""
