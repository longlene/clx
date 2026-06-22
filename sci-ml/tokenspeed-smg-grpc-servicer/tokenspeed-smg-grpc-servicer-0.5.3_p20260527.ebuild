# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="SMG gRPC servicer implementations for LLM inference engines"
HOMEPAGE="https://github.com/lightseekorg/smg https://pypi.org/project/tokenspeed-smg-grpc-servicer/"
SRC_URI="https://files.pythonhosted.org/packages/3d/29/8a889cc33014026e6dd4d4d4ee99814d05d404323c00d1c4b7d5e1a7822c/tokenspeed_smg_grpc_servicer-0.5.3.post20260527.tar.gz -> ${P}.tar.gz"

S="${WORKDIR}/tokenspeed_smg_grpc_servicer-${PV/_p/.post}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="sglang vllm"
RESTRICT="test"

RDEPEND="
	$(python_gen_cond_dep '
		>=sci-ml/tokenspeed-smg-grpc-proto-0.4.7[${PYTHON_USEDEP}]
		>=dev-python/grpcio-1.78.0[${PYTHON_USEDEP}]
		>=dev-python/grpcio-health-checking-1.78.0[${PYTHON_USEDEP}]
		>=dev-python/grpcio-reflection-1.78.0[${PYTHON_USEDEP}]
	')
	sglang? ( >=sci-ml/sglang-0.5.10 )
	vllm? ( >=sci-ml/vllm-0.19.0 )
"
