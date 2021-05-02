# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby22 ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A simple hello world gem"
HOMEPAGE="https://github.com/swistak35/orbacle"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/priority_queue_cxx-0"
ruby_add_rdepend ">=dev-ruby/lsp-protocol-0.0.3"
ruby_add_rdepend ">=dev-ruby/parser-2.4.0.2"
ruby_add_rdepend ">=dev-ruby/rubytree-0.9.7"
ruby_add_rdepend ">=dev-ruby/rgl-0.5.3"
ruby_add_rdepend ">=dev-ruby/bundler-1.9"
ruby_add_rdepend ">=dev-ruby/rspec-0"
ruby_add_rdepend ">=dev-ruby/byebug-0"
ruby_add_rdepend ">=dev-ruby/hash_diff-0.6.2"
ruby_add_rdepend ">=dev-ruby/nokogiri-1.8.4"
ruby_add_rdepend ">=dev-ruby/mutant-rspec-0"
ruby_add_rdepend ">=dev-ruby/ruby-prof-0"

