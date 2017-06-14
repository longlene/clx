# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Deface is a library that allows you to customize ERB, Haml and Slim views in a Rails application without editing the underlying view"
HOMEPAGE="https://github.com/spree/deface"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/nokogiri-1.6"
ruby_add_rdepend ">=dev-ruby/rails-4.1"
ruby_add_rdepend ">=dev-ruby/rainbow-2.1.0"
ruby_add_rdepend ">=dev-ruby/polyglot-0"
ruby_add_rdepend ">=dev-ruby/appraisal-0"
ruby_add_rdepend ">=dev-ruby/erubis-0"
ruby_add_rdepend ">=dev-ruby/rspec-3.1.0"
ruby_add_rdepend ">=dev-ruby/haml-4.0"
ruby_add_rdepend ">=dev-ruby/slim-3.0"
ruby_add_rdepend ">=dev-ruby/simplecov-0.6.4"
ruby_add_rdepend ">=dev-ruby/generator_spec-0.8"

