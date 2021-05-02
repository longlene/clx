# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Ruby bindings for the Apache Thrift RPC system"
HOMEPAGE="http://thrift.apache.org"

LICENSE="Apache 2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rspec-2.10.0"
ruby_add_rdepend ">=dev-ruby/rack-1.5"
ruby_add_rdepend ">=dev-ruby/rack-test-0.6"
ruby_add_rdepend ">=dev-ruby/thin-1.5"
ruby_add_rdepend ">=dev-ruby/bundler-1"
ruby_add_rdepend ">=dev-ruby/rake-10.5"

