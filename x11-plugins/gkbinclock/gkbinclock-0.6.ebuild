# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="Binary clock for GKrellM1/2"
HOMEPAGE="http://www.kagami.org/${PN}/"
SRC_URI="http://www.kagami.org/${PN}/${PF}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"

IUSE=""
DEPEND="app-admin/gkrellm"

src_compile() {
	has_version "<app-admin/gkrellm-2" && make gkbinclock.1.so
	has_version ">=app-admin/gkrellm-2" && make gkbinclock.2.so
}

src_install() {
	has_version "<app-admin/gkrellm-2" && {
		insinto /usr/lib/gkrellm/plugins
		doins gkbinclock.1.so
	}
	has_version ">=app-admin/gkrellm-2" && {
		insinto /usr/lib/gkrellm2/plugins
		doins gkbinclock.2.so
	}
	dodoc ChangeLog README TODO
}
