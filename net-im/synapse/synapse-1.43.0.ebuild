# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_9 )
inherit distutils-r1

DESCRIPTION="Synapse: Matrix reference homeserver"
HOMEPAGE="http://matrix.org"
SRC_URI="https://github.com/matrix-org/synapse/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-libs/libxslt
	>=dev-python/jsonschema-2.5.1
	>=dev-python/frozendict-1
	>=dev-python/unpaddedbase64-1.1.0
	>=dev-python/canonicaljson-1.4.0
	>=dev-python/signedjson-1.1.0
	>=dev-python/pynacl-1.2.1
	>=dev-python/idna-2.5
	>=dev-python/service_identity-18.1.0
	>=dev-python/twisted-18.9.0
	>=dev-python/treq-15.1
	>=dev-python/pyopenssl-16.0.0
	>=dev-python/pyyaml-3.11
	>=dev-python/pyasn1-0.1.9
	>=dev-python/pyasn1-modules-0.0.7
	>=dev-python/bcrypt-3.1.0
	>=dev-python/pillow-4.3.0
	>=dev-python/sortedcontainers-1.4.4
	>=dev-python/pymacaroons-0.13.0
	>=dev-python/msgpack-0.5.2
	>=dev-python/phonenumbers-8.2.0
	>=dev-python/prometheus_client-0.4.0
	>=dev-python/attrs-19.2.0
	>=dev-python/netaddr-0.7.18
	>=dev-python/jinja2-2.9
	>=dev-python/bleach-1.4.3
	>=dev-python/typing-extensions-3.7.4
	>=dev-python/cryptography-3.4.7
	>=dev-python/ijson-3.0
"
