# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="4e34bcebdcf8e45265986eb43ad4ad03bb41a581"

DESCRIPTION="A common lisp implementation of spark"
HOMEPAGE="https://github.com/tkych/cl-spark"
SRC_URI="https://github.com/tkych/cl-spark/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_preapre() {
	default
	rm ${PN}-test.asd spark-test.lisp run-tests.lisp
}
