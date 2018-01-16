# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Why another static site generator? Machined is for the developers who know and love the asset pipeline of Rails 3"
HOMEPAGE="https://github.com/petebrowne/machined"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/tilt-1.3.3"
ruby_add_rdepend ">=dev-ruby/rack-1.5.0"
ruby_add_rdepend ">=dev-ruby/sprockets-2.12.0"
ruby_add_rdepend ">=dev-ruby/sprockets-helpers-1.1.0"
ruby_add_rdepend ">=dev-ruby/sprockets-sass-1.2.0"
ruby_add_rdepend ">=dev-ruby/padrino-helpers-0.10.7"
ruby_add_rdepend ">=dev-ruby/activesupport-3.2.3"
ruby_add_rdepend ">=dev-ruby/i18n-0.6.0"
ruby_add_rdepend ">=dev-ruby/thor-0.15.4"
ruby_add_rdepend ">=dev-ruby/crush-0.3.3"
ruby_add_rdepend ">=dev-ruby/rspec-2.13.0"
ruby_add_rdepend ">=dev-ruby/rack-test-0.6.1"
ruby_add_rdepend ">=dev-ruby/test-construct-1.2.0"
ruby_add_rdepend ">=dev-ruby/unindent-1.0"
ruby_add_rdepend ">=dev-ruby/sprockets-plugin-0.2.1"
ruby_add_rdepend ">=dev-ruby/haml-0"
ruby_add_rdepend ">=dev-ruby/sass-0"
ruby_add_rdepend ">=dev-ruby/slim-0"
ruby_add_rdepend ">=dev-ruby/erubis-0"
ruby_add_rdepend ">=dev-ruby/rdiscount-0"
ruby_add_rdepend ">=dev-ruby/uglifier-0"
ruby_add_rdepend ">=dev-ruby/rake-0"

