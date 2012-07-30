# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils

DESCRIPTION="VR-Render is a free IRCAD DICOM Viewer Software"
HOMEPAGE="http://www.ircad.fr/softwares/vr-render/Software.php"
SRC_URI="x86? ( http://org-www.ircad.fr/softwares/vr-render/download/linux32/VRRender_v0.8-32.tgz )
         amd64? ( http://org-www.ircad.fr/softwares/vr-render/download/linux64/VRRender_v0.8-64.tgz )"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

src_install() {

if use amd64 ; then
	S="${WORKDIR}/VRRender_v0-8_posix_x86-64_17856"
fi
if use x86 ; then
	S="${WORKDIR}/VRRender_v0-8_posix_x86-32_17856"
fi

dodoc ${S}/COPYING ${S}/INSTALL ${S}/THIRDPARTYLICENSEREADME.html ${S}/VR-Render-Doc.pdf || die

local d="/opt/${PN}"

insinto ${d} 

doins -r ${S}/VRRender.app/* || die

dosym ${d}/VRRender.sh /usr/bin/vrrender.sh || die

exeinto ${d}

doexe ${S}/VRRender.app/launcher ${S}/VRRender.app/VRRender.sh || die

dosed 's:VRPATH=`which vrrender.sh | sed -e "s/.*\///g"`:VRPATH=/opt/vrrender-bin:' ${d}/VRRender.sh || die

make_desktop_entry vrrender.sh "VRRender" ${PN}.png

mv ${D}/usr/share/applications/vrrender.sh-vrrender-bin.desktop ${D}/usr/share/applications/vrrender-bin.desktop || die

newicon ${S}/VRRender.app/Bundles/basicVRCtrl_0-0/vrrender.png ${PN}.png
}
