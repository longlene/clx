# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Job queue system to run job with Docker"
HOMEPAGE="https://github.com/cookpad/barbeque"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/adminlte2-rails-0"
ruby_add_rdepend ">=dev-ruby/aws-sdk-0"
ruby_add_rdepend ">=dev-ruby/coffee-rails-0"
ruby_add_rdepend ">=dev-ruby/hamlit-0"
ruby_add_rdepend ">=dev-ruby/hashie-0"
ruby_add_rdepend ">=dev-ruby/jquery-rails-0"
ruby_add_rdepend ">=dev-ruby/kaminari-0"
ruby_add_rdepend ">=dev-ruby/rails-5.0.0"
ruby_add_rdepend ">=dev-ruby/rinku-0"
ruby_add_rdepend ">=dev-ruby/sass-rails-0"
ruby_add_rdepend ">=dev-ruby/serverengine-0"
ruby_add_rdepend ">=dev-ruby/the_garage-0"
ruby_add_rdepend ">=dev-ruby/uglifier-0"
ruby_add_rdepend ">=dev-ruby/weak_parameters-0"
ruby_add_rdepend ">=dev-ruby/autodoc-0"
ruby_add_rdepend ">=dev-ruby/factory_girl_rails-0"
ruby_add_rdepend ">=dev-ruby/listen-0"
ruby_add_rdepend ">=dev-ruby/mysql2-0"
ruby_add_rdepend ">=dev-ruby/rspec-rails-0"

