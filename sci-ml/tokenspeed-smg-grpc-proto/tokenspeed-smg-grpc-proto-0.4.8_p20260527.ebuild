# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1

DESCRIPTION="SMG gRPC proto definitions for SGLang, vLLM, TRT-LLM, and MLX"
HOMEPAGE="https://github.com/lightseekorg/smg https://pypi.org/project/tokenspeed-smg-grpc-proto/"
SRC_URI="https://files.pythonhosted.org/packages/33/a2/7512a816cbfda4cae3ce157cb533261596d7885869cc3ea671c74828dddd/tokenspeed_smg_grpc_proto-0.4.8.post20260527.tar.gz -> ${P}.tar.gz"

S="${WORKDIR}/tokenspeed_smg_grpc_proto-${PV/_p/.post}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="$(python_gen_cond_dep '
	>=dev-python/grpcio-1.78.0[${PYTHON_USEDEP}]
	>=dev-python/protobuf-5.26.0[${PYTHON_USEDEP}]
')"

BDEPEND="$(python_gen_cond_dep '
	>=dev-python/grpcio-tools-1.78.0[${PYTHON_USEDEP}]
')"
