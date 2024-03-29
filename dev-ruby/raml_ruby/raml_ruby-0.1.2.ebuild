# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Implementation of RAML parser in Ruby"
HOMEPAGE="https://github.com/coub/raml_ruby"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activesupport-4.1"
ruby_add_rdepend ">=dev-ruby/json-schema-2.5"
ruby_add_rdepend ">=dev-ruby/uri_template-0.7"
ruby_add_rdepend ">=dev-ruby/bundler-1.11"
ruby_add_rdepend ">=dev-ruby/rake-10.0"
ruby_add_rdepend ">=dev-ruby/rspec-3.0"
ruby_add_rdepend ">=dev-ruby/rr-1.1"
ruby_add_rdepend ">=dev-ruby/pry-0.10"
ruby_add_rdepend ">=dev-ruby/yard-0.8"

