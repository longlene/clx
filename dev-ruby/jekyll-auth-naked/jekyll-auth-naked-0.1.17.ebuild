# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="                            A simple way to self-host a Github OAuth protected jekyll site to your
                            GitHub Team"
HOMEPAGE="https://github.com/jasonm23/jekyll-auth-naked"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/jekyll-2.0"
ruby_add_rdepend ">=dev-ruby/activesupport-4.1"
ruby_add_rdepend ">=dev-ruby/sinatra-index-0.0"
ruby_add_rdepend ">=dev-ruby/sinatra_auth_github-1.0"
ruby_add_rdepend ">=dev-ruby/commander-4.1"
ruby_add_rdepend ">=dev-ruby/git-1.2"
ruby_add_rdepend ">=dev-ruby/dotenv-0.11"
ruby_add_rdepend ">=dev-ruby/rake-10.3"
ruby_add_rdepend ">=dev-ruby/rack-ssl-enforcer-0.2"
ruby_add_rdepend ">=dev-ruby/safe_yaml-1.0"

