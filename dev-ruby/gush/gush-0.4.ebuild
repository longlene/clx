# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Gush is a parallel workflow runner using only Redis as its message broker and Sidekiq for workers"
HOMEPAGE="https://github.com/pokonski/gush"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/sidekiq-4.0"
ruby_add_rdepend ">=dev-ruby/multi_json-1.11"
ruby_add_rdepend ">=dev-ruby/redis-3.2"
ruby_add_rdepend ">=dev-ruby/hiredis-0.6"
ruby_add_rdepend ">=dev-ruby/ruby-graphviz-1.2"
ruby_add_rdepend ">=dev-ruby/terminal-table-1.4"
ruby_add_rdepend ">=dev-ruby/colorize-0.7"
ruby_add_rdepend ">=dev-ruby/thor-0.19"
ruby_add_rdepend ">=dev-ruby/launchy-2.4"
ruby_add_rdepend ">=dev-ruby/bundler-1.5"
ruby_add_rdepend ">=dev-ruby/rake-10.4"
ruby_add_rdepend ">=dev-ruby/rspec-3.0"
ruby_add_rdepend ">=dev-ruby/pry-0.10"
ruby_add_rdepend ">=dev-ruby/fakeredis-0.5"

