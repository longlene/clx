# Copyright 1999-2004 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/eclass/kde-meta.eclass,v 1.82 2007/03/18 21:39:30 carlo Exp $
#
# Author Anant Narayanan <anant@gentoo.org>
#
# This is the plan9-cmds eclass which supports broken-up Plan9 applications.

inherit plan9-libs

function plan9-cmds_src_compile() {
plan9-libs_src_compile
}

function plan9-cmds_src_install() {
set_path
mk install || die "Install Failed!"

dobin ${S}/bin/${PN}
doman ${S}/man/man1/${PN}.1
}

EXPORT_FUNCTIONS src_compile src_install

