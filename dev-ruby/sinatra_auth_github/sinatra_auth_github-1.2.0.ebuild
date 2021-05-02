# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A sinatra extension for easy oauth integration with github"
HOMEPAGE="http://github.com/atmos/sinatra_auth_github"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/sinatra-1.0"
ruby_add_rdepend ">=dev-ruby/warden-github-1.2.0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/rspec-2.4.0"
ruby_add_rdepend ">=dev-ruby/shotgun-0"
ruby_add_rdepend ">=dev-ruby/randexp-0.1.5"
ruby_add_rdepend ">=dev-ruby/rack-test-0.5.3"

