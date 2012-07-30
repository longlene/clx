# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

# To do a version bump, edit or duplicate the following lines:
[[ ${PV} == "0.4.0b" ]] && MY_P="fritzing.2010.07.06.source"
[[ ${PV} == "0.4.1b" ]] && MY_P="fritzing.2010.07.17.source"
[[ ${PV} == "0.4.2b" ]] && MY_P="fritzing.2010.08.06.source"
[[ ${PV} == "0.4.3b" ]] && MY_P="fritzing.2010.10.01.source"

[[ ${PV} == "0.5.0b" ]] && MY_P="fritzing.2011.02.12.source"
[[ ${PV} == "0.5.1b" ]] && MY_P="fritzing.2011.02.14.source"
[[ ${PV} == "0.5.2b" ]] && MY_P="fritzing.2011.02.18.source"

[[ ${PV} == "0.6.0b" ]] && MY_P="fritzing.2011.07.09.source"
[[ ${PV} == "0.6.1b" ]] && MY_P="fritzing.2011.07.09.source"
[[ ${PV} == "0.6.2b" ]] && MY_P="fritzing.2011.07.11.source"
#[[ ${PV} == "0.6.3b" ]] && MY_P="fritzing.2011.XX.XX.source"
# and so on ... you get the idea

[[ ${PV} == "9999" ]]   && MY_P="fritzing"


if [[ -z "${MY_P}" ]]; then
  eerror "Version '${PV}' is not yet supported by this ebuild, see ebuild file for more information."
  die
fi

if [[ ${PV} == "9999" ]]; then
        inherit qt4 subversion
        ESVN_REPO_URI="http://fritzing.googlecode.com/svn/trunk/fritzing"
else
        inherit qt4
        SRC_URI="http://fritzing.org/download/${PV}/source-tarball/${MY_P}.tar.bz2"
        KEYWORDS="~amd64 ~x86"
fi

DESCRIPTION="breadboard and arduino prototyping"
HOMEPAGE="http://fritzing.org/"

LICENSE="GPL-3 CCPL-Attribution-ShareAlike-3.0"
SLOT="0"
IUSE=""

DEPEND="x11-libs/qt-gui:4
	x11-libs/qt-sql:4
	x11-libs/qt-svg:4
	x11-libs/qt-webkit:4"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_P}"

src_configure(){
	eqmake4 phoenix.pro || die "eqmake4 failed"
}

src_install(){
	exeinto /opt/fritzing
	doexe Fritzing || die "install failed"
	insinto /opt/fritzing
	for d in parts sketches bins translations
	do
		echo "Installing ${d} to /opt/fritzing..."
		doins -r "${d}" || die "install failed"
	done
	dosym ../../opt/fritzing/Fritzing /usr/bin/fritzing
}
