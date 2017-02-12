# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Simple, Heroku-friendly Rails app configuration using ENV and a single YAML file"
HOMEPAGE="https://github.com/laserlemon/figaro"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/thor-0.14"
ruby_add_rdepend ">=dev-ruby/bundler-1.7"
ruby_add_rdepend ">=dev-ruby/rake-10.4"

