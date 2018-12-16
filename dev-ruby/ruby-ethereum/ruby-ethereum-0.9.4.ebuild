# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Ethereum's implementation in ruby"
HOMEPAGE="https://github.com/janx/ruby-ethereum"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend "=dev-ruby/rlp-0.7.3"
ruby_add_rdepend ">=dev-ruby/ethash-0.2"
ruby_add_rdepend ">=dev-ruby/bitcoin-secp256k1-0.4"
ruby_add_rdepend ">=dev-ruby/lru_redux-1.1"
ruby_add_rdepend ">=dev-ruby/ffi-1.9"
ruby_add_rdepend ">=dev-ruby/digest-sha3-1.1"
ruby_add_rdepend ">=dev-ruby/block_logger-0.1"
ruby_add_rdepend "=dev-ruby/leveldb-0.1.9"
ruby_add_rdepend ">=dev-ruby/rake-10.5"
ruby_add_rdepend "=dev-ruby/minitest-5.8.3"
ruby_add_rdepend "=dev-ruby/yard-0.8.7.6"
ruby_add_rdepend ">=dev-ruby/serpent-0.3"

