# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit bash-completion-r1 eutils

DESCRIPTION="Static Code Analyzer for C, C++ and C#"
HOMEPAGE="https://www.viva64.com/en/pvs-studio/"
SRC_URI="https://files.viva64.com/${P}-x86_64.tgz"

LICENSE="free-noncomm"
SLOT="0"
KEYWORDS="~amd64"
IUSE="bash-completion"

# Binary prebuilt package
QA_PRESTRIPPED="
	/usr/bin/pvs-studio-analyzer
	/usr/bin/pvs-studio
	/usr/bin/plog-converter
"

S="${WORKDIR}/${P}-x86_64"

src_install() {
	dobin bin/plog-converter bin/pvs-studio bin/pvs-studio-analyzer
	dodoc README.md

	if use bash-completion; then
		newbashcomp etc/bash_completion.d/${PN}.sh plog-converter
		bashcomp_alias plog-converter pvs-studio-analyzer
	fi
}
