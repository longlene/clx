# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION=""
HOMEPAGE="http://github.com/glean/glean"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/rspec-0"
ruby_add_rdepend ">=dev-ruby/guard-rspec-0"
ruby_add_rdepend ">=dev-ruby/rb-fsevent-0"
ruby_add_rdepend ">=dev-ruby/rspec-nc-0"
ruby_add_rdepend ">=dev-ruby/pry-0"
ruby_add_rdepend ">=dev-ruby/gli-2.5"
ruby_add_rdepend ">=dev-ruby/git-1.2"
ruby_add_rdepend ">=dev-ruby/toml-0.0.3"
ruby_add_rdepend ">=dev-ruby/octokit-2.0"
ruby_add_rdepend ">=dev-ruby/hashie-2.0"
ruby_add_rdepend ">=dev-ruby/json-1.7"

