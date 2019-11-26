# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A Ruby implementation of the Coveralls API"
HOMEPAGE="https://coveralls.io"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend "=dev-ruby/rest-client-1.6.7"
ruby_add_rdepend "=dev-ruby/term-ansicolor-1.2.2"
ruby_add_rdepend ">=dev-ruby/multi_json-1.3"
ruby_add_rdepend "=dev-ruby/thor-0.18.1"
ruby_add_rdepend ">=dev-ruby/simplecov-0.7"
ruby_add_rdepend "=dev-ruby/rspec-2.14.1"
ruby_add_rdepend "=dev-ruby/rake-10.0.3"
ruby_add_rdepend "=dev-ruby/webmock-1.7"
ruby_add_rdepend "=dev-ruby/vcr-1.11.3"

