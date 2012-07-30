# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="A java client for mpd"
HOMEPAGE="http://sccs.swarthmore.edu/~cbr/PlayGUI/"
SRC_URI="http://sccs.swarthmore.edu/~cbr/PlayGUI/${PF}.tar.gz"
SLOT="0"
RDEPEND=">=virtual/jre-1.4"
KEYWORDS="x86 amd64 ppc"
IUSE=""
LICENSE="GPL-2"

src_install()
{
  dodir /usr/lib
  dodir /usr/bin

  find ${WORKDIR}

  cp ${WORKDIR}/* ${D}usr/lib

  echo "#! /bin/sh" > ${D}usr/bin/playgui
  echo "java -jar /usr/lib/${PF}.jar \"\${@}\"" >> ${D}usr/bin/playgui
  chmod ugo+rx ${D}usr/bin/playgui
}
