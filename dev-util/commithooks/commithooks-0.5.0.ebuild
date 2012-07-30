# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

EGIT_REPO_URI="git://git.complete.org/commithooks"
EGIT_TREE="f30e13e43b669a7806adcad8cbc7e62b3c3d3451"

inherit eutils git

DESCRIPTION="Commit hooks for version control systems to inject the result into bugtrackers"
HOMEPAGE="http://software.complete.org/software/projects/show/commithooks"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~sparc"

IUSE="git darcs mercurial trac"

DEPEND=""
RDEPEND="${DEPEND}
	git? ( dev-util/git )
	darcs? ( dev-util/darcs )
	mercurial? ( dev-util/mercurial )
	trac? ( www-apps/trac )"

src_prepare() {
	use trac && trac_version=$(best_version www-apps/trac | sed 's/www-apps\/trac/trac/')

	sed -i \
		-e "s:^INSTDIR=.*$:INSTDIR=/usr/share/${PN}/vcs-hooks:" \
		darcs-both-commit
	sed -i \
		-e "s:^BASE=.*$:BASE=/usr/share/${PN}/vcs-hooks:" \
		git-both-commit \
		hg-both-commit
	sed -i \
		-e "s:^GITREVCMD=.*$:GITREVCMD=/usr/share/${PN}/support/git-find-revs:" \
		git-deb-commit \
		git-trac-commit
	sed -i \
		-e "s:^CMD=.*$:CMD=/usr/share/${PN}/bt-hooks/deb-post-commit-hook:" \
		git-deb-commit \
		hg-deb-commit
	sed -i \
		-e "s:^CMD=.*$:CMD=/usr/share/doc/${trac_version}/contrib/trac-post-commit-hook:" \
		git-trac-commit \
		hg-trac-commit
}

src_install() {
	exeinto /usr/share/${PN}/support
	use git && doexe git-find-revs

	exeinto /usr/share/${PN}/bt-hooks
	doexe deb-post-commit-hook
	use trac && doexe trac-post-commit-hook

	exeinto /usr/share/${PN}/vcs-hooks
	use darcs && doexe darcs-both-commit
	use git && doexe git-both-commit git-deb-commit git-trac-commit
	use mercurial && doexe hg-both-commit hg-deb-commit hg-trac-commit

	dodoc COPYING COPYRIGHT README
}
