# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit autotools common-lisp-3

DESCRIPTION="Common Lisp environment setup Utility"
HOMEPAGE="https://github.com/snmsts/roswell"
SRC_URI="https://github.com/snmsts/roswell/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="bash-completion test zsh-completion"

DEPEND="net-misc/curl"
RDEPEND="${DEPEND}
	dev-lisp/simple-date-time
	dev-lisp/split-sequence
	dev-lisp/plump
	test? ( dev-lisp/prove )
"

src_prepare() {
	eapply_user
	use test || rm -rf ${PN}-test.asd t
	eautoreconf
}

src_install() {
	emake DESTDIR="${D}" install
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
	if use bash-completion ; then
		insinto /usr/share/bash-completion/completions
		doins scripts/completion-bash/ros
	fi

	if use zsh-completion ; then
		insinto /usr/share/zsh/site-functions
		doins scripts/completion-zsh/ros
	fi
}
