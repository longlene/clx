# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Provides the generator settings required for Rails 3+ to use Slim"
HOMEPAGE="https://github.com/slim-template/slim-rails"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/actionpack-3.1"
ruby_add_rdepend ">=dev-ruby/railties-3.1"
ruby_add_rdepend ">=dev-ruby/slim-3.0"
ruby_add_rdepend ">=dev-ruby/sprockets-rails-0"
ruby_add_rdepend ">=dev-ruby/rocco-0"
ruby_add_rdepend ">=dev-ruby/redcarpet-0"
ruby_add_rdepend ">=dev-ruby/awesome_print-0"
ruby_add_rdepend ">=dev-ruby/actionmailer-3.1"
ruby_add_rdepend ">=dev-ruby/appraisal-0"

