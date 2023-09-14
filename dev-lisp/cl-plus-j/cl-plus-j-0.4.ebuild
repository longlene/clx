# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

DESCRIPTION="A Common Lisp Interface to Java"
HOMEPAGE="https://common-lisp.net/project/cl-plus-j/"
SRC_URI="http://common-lisp.net/project/cl-plus-j/releases/cl+j-${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="example"

DEPEND=">=virtual/jdk-1.5"
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/trivial-garbage
	dev-lisp/bordeaux-threads
	>=virtual/jre-1.5
"

S="${WORKDIR}"/cl+j-${PV}

src_prepare() {
	eapply_user
	use example || rm -r demos
	sed -e "s#JRE_HOME#JAVA_HOME#g" \
		-e "s#/lib/i386/client/libjvm.so#/jre/lib/i386/client/libjvm.so#g" \
		-e "s#/lib/amd64/server/libjvm.so#/jre/lib/amd64/server/libjvm.so#g" \
		-e "s#;;(defvar \*jvm-options\*)#\(defvar *jvm-options* \'(\"-Djava.class.path=/usr/share/common-lisp/source/cl-plus-j/cl_j.jar\"\)\)#" \
		-i jni.lisp
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all cl_j.jar
}
