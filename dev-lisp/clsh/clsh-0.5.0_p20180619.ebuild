# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="e4cb3f410fa0f631f2b60add6bfe7e8e74078831"

DESCRIPTION="A set of Lispy bindings for running and composing *nix processes"
HOMEPAGE="https://github.com/obicons/clsh"
SRC_URI="https://github.com/obicons/clsh/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/split-sequence
	dev-lisp/trivial-gray-streams
	dev-lisp/osicat
"
