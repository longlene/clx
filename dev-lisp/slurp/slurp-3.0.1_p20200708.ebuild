# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="caf41ab2ae311738c666a48983aa01d06934ea38"

DESCRIPTION="Making reader which slurp content from huge file"
HOMEPAGE="https://github.com/hyotang666/slurp"
SRC_URI="https://github.com/hyotang666/slurp/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/trivial-garbage
"
BDEPEND=""
