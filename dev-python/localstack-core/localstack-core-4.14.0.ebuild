# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Core library and runtime of LocalStack, a local AWS cloud emulator"
HOMEPAGE="
	https://localstack.cloud
	https://github.com/localstack/localstack
"
SRC_URI="https://github.com/localstack/localstack/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/localstack-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="runtime"
# tests need the full runtime, docker and network access
RESTRICT="test"

RDEPEND="
	>=dev-python/asn1crypto-1.5.1[${PYTHON_USEDEP}]
	>=dev-python/cachetools-5.0[${PYTHON_USEDEP}]
	>=dev-python/click-8.2.0[${PYTHON_USEDEP}]
	dev-python/cryptography[${PYTHON_USEDEP}]
	>=dev-python/dnslib-0.9.10[${PYTHON_USEDEP}]
	>=dev-python/dnspython-1.16.0[${PYTHON_USEDEP}]
	>=dev-python/plux-1.14.0[${PYTHON_USEDEP}]
	>=dev-python/psutil-5.4.8[${PYTHON_USEDEP}]
	>=dev-python/python-dotenv-0.19.1[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-5.1[${PYTHON_USEDEP}]
	>=dev-python/requests-2.20.0[${PYTHON_USEDEP}]
	>=dev-python/rich-12.3.0[${PYTHON_USEDEP}]
	>=dev-python/semver-2.10[${PYTHON_USEDEP}]
	runtime? (
		>=dev-python/boto3-1.42.54[${PYTHON_USEDEP}]
		>=dev-python/botocore-1.42.54[${PYTHON_USEDEP}]
		>=dev-python/awscrt-0.13.14[${PYTHON_USEDEP}]
		>=dev-python/cbor2-5.5.0[${PYTHON_USEDEP}]
		>=dev-python/dill-0.3.6[${PYTHON_USEDEP}]
		>=dev-python/docker-6.1.1[${PYTHON_USEDEP}]
		>=dev-python/jsonpatch-1.24[${PYTHON_USEDEP}]
		>=dev-python/jsonpointer-3.0.0[${PYTHON_USEDEP}]
		>=dev-python/jsonschema-4.25.1[${PYTHON_USEDEP}]
		>=dev-python/hypercorn-0.14.4[${PYTHON_USEDEP}]
		>=dev-python/localstack-twisted-25.0[${PYTHON_USEDEP}]
		>=dev-python/openapi-core-0.19.2[${PYTHON_USEDEP}]
		>=dev-python/pydantic-2.11.9[${PYTHON_USEDEP}]
		>=dev-python/pyopenssl-23.0.0[${PYTHON_USEDEP}]
		>=dev-python/python-dateutil-2.9.0[${PYTHON_USEDEP}]
		>=dev-python/readerwriterlock-1.0.7[${PYTHON_USEDEP}]
		>=dev-python/requests-aws4auth-1.0[${PYTHON_USEDEP}]
		>=dev-python/urllib3-2.0.7[${PYTHON_USEDEP}]
		>=dev-python/werkzeug-3.1.3[${PYTHON_USEDEP}]
		>=dev-python/xmltodict-0.13.0[${PYTHON_USEDEP}]
		>=dev-python/rolo-0.8.1[${PYTHON_USEDEP}]
		>=app-admin/awscli-1.44.44 <app-admin/awscli-2
		>=dev-python/airspeed-ext-0.6.3[${PYTHON_USEDEP}]
		~dev-python/antlr4-python3-runtime-4.13.2[${PYTHON_USEDEP}]
		>=dev-python/apispec-5.1.1[${PYTHON_USEDEP}]
		>=dev-python/aws-sam-translator-1.105.0[${PYTHON_USEDEP}]
		>=dev-python/crontab-0.22.6[${PYTHON_USEDEP}]
		>=dev-python/jinja2-3.1.6[${PYTHON_USEDEP}]
		>=dev-python/jpype-1.6.0[${PYTHON_USEDEP}]
		>=dev-python/jsonpath-ng-1.6.1[${PYTHON_USEDEP}]
		>=dev-python/jsonpath-rw-1.4.0[${PYTHON_USEDEP}]
		>=dev-python/kclpy-ext-3.0.0[${PYTHON_USEDEP}]
		>=dev-python/moto-ext-5.1.22[${PYTHON_USEDEP}]
		>=dev-python/opensearch-py-2.4.1[${PYTHON_USEDEP}]
		>=dev-python/pymongo-4.2.0[${PYTHON_USEDEP}]
		>=dev-python/responses-0.25.8[${PYTHON_USEDEP}]
	)
"
BDEPEND="
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
"

src_prepare() {
	export SETUPTOOLS_SCM_PRETEND_VERSION=${PV}
	distutils-r1_src_prepare
}
