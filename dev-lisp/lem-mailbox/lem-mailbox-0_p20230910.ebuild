# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="12d629541da440fadf771b0225a051ae65fa342a"

DESCRIPTION="Mailbox ANSI CL implementation from SBCL"
HOMEPAGE="https://github.com/lem-project/lem-mailbox"
SRC_URI="https://github.com/lem-project/lem-mailbox/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/bordeaux-threads
	dev-lisp/bt-semaphore
	dev-lisp/queues
"
BDEPEND=""

src_prepare() {
	default
	rm -rf tests
}
