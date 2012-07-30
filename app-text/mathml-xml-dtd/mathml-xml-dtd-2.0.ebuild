# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit versionator

MY_P="${PN/-*/}$(get_major_version)"

DESCRIPTION="MathML DTD and entity files"
HOMEPAGE="http://www.w3.org/1998/Math/MathML"
SRC_URI="http://www.w3.org/Math/DTD/${MY_P}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-libs/libxml2"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_P}"

src_install() {
	INSTALL_DIRECTORY="/usr/share/sgml/mathml/${P}"

	insinto ${INSTALL_DIRECTORY}
	doins -r * || die
}

pkg_postinst() {
	if [[ ! -r ${ROOT}etc/xml/mathml ]] ; then
		ebegin "Creating MathML catalog"
		xmlcatalog --noout --create "${ROOT}"etc/xml/mathml
		eend $? "Failed to create MathML catalog"
		[[ $? -ne 0 ]] && return
	fi

	einfo "Updating Root XML Catalog"
	xmlcatalog --noout \
		--add "delegatePublic" "-//W3C//DTD MathML" "file:///etc/xml/mathml" \
		--add "delegatePublic" "-//W3C//ENTITIES" "file:///etc/xml/mathml" \
		--add "delegateURI" "http://www.w3.org/TR/2001/REC-MathML2-20010221/dtd" "file:///etc/xml/mathml" \
		"${ROOT}"etc/xml/catalog

	einfo "Updating MathML Catalog"

	(
		IFS=";"
		sed -n "/PUBLIC \"/ {N; s/\n/ /; s/^[^\"]*\"//; s/SYSTEM//; s/\"[^\"]*$//; s%\"[[:blank:]]\+\"%;${INSTALL_DIRECTORY}/%; p};" \
						"${ROOT}${INSTALL_DIRECTORY#/}"/mathml2.dtd | while read orig replace
		do
			xmlcatalog --noout --add public "${orig}" "file://${replace}" "${ROOT}"etc/xml/mathml
		done
	)

	xmlcatalog --noout \
		--add "rewriteSystem" \
		"http://www.w3.org/TR/2001/REC-MathML2-20010221/dtd" "file://${INSTALL_DIRECTORY}" \
		"${ROOT}"etc/xml/mathml

	xmlcatalog --noout \
		--add "rewriteURI" \
		"http://www.w3.org/TR/2001/REC-MathML2-20010221/dtd" "file://${INSTALL_DIRECTORY}" \
		"${ROOT}"etc/xml/mathml
}

pkg_postrm() {
	einfo "Cleaning Root XML Catalog"

	xmlcatalog --noout \
		--del "-//W3C//DTD MathML" \
		--del "-//W3C//ENTITIES" \
		--del "http://www.w3.org/TR/2001/REC-MathML2-20010221/dtd" \
		"${ROOT}"etc/xml/catalog

	einfo "Cleaning MathML Catalog"

	sed -i "/${P}/d" "${ROOT}"etc/xml/mathml
}
