# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Library to build, parse, and sign Ethereum transactions"
HOMEPAGE="https://github.com/se3000/ruby-eth"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/digest-sha3-1.1"
ruby_add_rdepend ">=dev-ruby/ffi-1.0"
ruby_add_rdepend ">=dev-ruby/money-tree-0.9"
ruby_add_rdepend ">=dev-ruby/rlp-0.7.3"
ruby_add_rdepend ">=dev-ruby/bundler-1.12"
ruby_add_rdepend ">=dev-ruby/pry-0.1"
ruby_add_rdepend ">=dev-ruby/rake-10.0"
ruby_add_rdepend ">=dev-ruby/rspec-3.0"

