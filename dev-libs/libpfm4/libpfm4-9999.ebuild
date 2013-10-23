# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit git-2 python linux-info

DESCRIPTION="A helper library to develop monitoring tools for Linux perf_events."
LICENSE="GPL-2"
HOMEPAGE="http://perfmon2.sourceforge.net/"
SRC_URI=""

EGIT_REPO_URI="git://perfmon2.git.sourceforge.net/gitroot/perfmon2/libpfm4"

SLOT="0"
IUSE="python examples"
KEYWORDS="~amd64"

DEPEND="
		python? (
			dev-lang/python
			dev-lang/swig 
		)
"

pkg_setup() {

	get_version
	if kernel_is 2 6 ; then
		einfo "Checking for suitable kernel configuration (Perf Events)"
		CONFIG_CHECK="${CONFIG_CHECK} ~PERF_EVENTS"
		check_extra_config
	else
		eerror "You must have a kernel >=2.6 to run libpfm4."
		die
	fi

	if use python ; then
		export CONFIG_PFMLIB_NOPYTHON="n"
	else
		export CONFIG_PFMLIB_NOPYTHON="y"
	fi
	
}

src_configure() {
	
	sed -i -e 's/\$(install_prefix)/$(EPREFIX)\/usr/' config.mk \
		|| die "sed failed"

}

src_install() {

	emake DESTDIR="${D}" install || die "Install failed"
	
	if use examples ; then
		emake DESTDIR="${D}" install_examples || die "Install failed"
	fi
	
}
