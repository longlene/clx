# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Process monitoring tool"
HOMEPAGE="http://github.com/kostya/eye"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/celluloid-0.17.3"
ruby_add_rdepend ">=dev-ruby/celluloid-io-0.17.0"
ruby_add_rdepend ">=dev-ruby/state_machines-0"
ruby_add_rdepend ">=dev-ruby/thor-0"
ruby_add_rdepend ">=dev-ruby/sigar-0.7.3"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend "<dev-ruby/rspec-2.14"
ruby_add_rdepend "=dev-ruby/rr-1.1.2"
ruby_add_rdepend ">=dev-ruby/ruby-graphviz-0"
ruby_add_rdepend ">=dev-ruby/forking-0"
ruby_add_rdepend ">=dev-ruby/fakeweb-0"
ruby_add_rdepend ">=dev-ruby/eventmachine-1.0.3"
ruby_add_rdepend ">=dev-ruby/sinatra-0"
ruby_add_rdepend ">=dev-ruby/thin-0"
ruby_add_rdepend ">=dev-ruby/xmpp4r-0"
ruby_add_rdepend ">=dev-ruby/slack-notifier-0"
ruby_add_rdepend ">=dev-ruby/coveralls-0"
ruby_add_rdepend "=dev-ruby/tins-1.6.0"
ruby_add_rdepend ">=dev-ruby/simplecov-0.8.1"
ruby_add_rdepend "<=dev-ruby/parallel_tests-1.3.1"
ruby_add_rdepend ">=dev-ruby/parallel_split_test-0"
ruby_add_rdepend ">=dev-ruby/rubocop-0"

