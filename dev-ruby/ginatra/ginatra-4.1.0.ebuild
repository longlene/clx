# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Git repository viewer with a rocking good web interface"
HOMEPAGE="https://github.com/narkoz/ginatra"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/sinatra-1.4.6"
ruby_add_rdepend ">=dev-ruby/rugged-0.21.4"
ruby_add_rdepend ">=dev-ruby/rouge-1.8.0"
ruby_add_rdepend ">=dev-ruby/sprockets-3.0"
ruby_add_rdepend "=dev-ruby/bootstrap-sass-3.3.3"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/rspec-0"
ruby_add_rdepend ">=dev-ruby/rack-test-0"
ruby_add_rdepend ">=dev-ruby/sinatra-contrib-0"
ruby_add_rdepend ">=dev-ruby/better_errors-1.1.0"
ruby_add_rdepend ">=dev-ruby/binding_of_caller-0"

